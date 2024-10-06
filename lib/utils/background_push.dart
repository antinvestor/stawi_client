/*
 *   Famedly
 *   Copyright (C) 2020, 2021 Famedly GmbH
 *   Copyright (C) 2021 Fluffychat
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Affero General Public License as
 *   published by the Free Software Foundation, either version 3 of the
 *   License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU Affero General Public License for more details.
 *
 *   You should have received a copy of the GNU Affero General Public License
 *   along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix.dart';
import 'package:unifiedpush/unifiedpush.dart';
import 'package:unifiedpush_ui/unifiedpush_ui.dart';

import 'package:fluffychat/config/app_config.dart';
import 'package:fluffychat/config/setting_keys.dart';
import 'package:fluffychat/utils/account_config.dart';
import 'package:fluffychat/utils/push_helper.dart';
import 'package:fluffychat/widgets/fluffy_chat_app.dart';
import 'package:fluffychat/widgets/matrix.dart';
import 'platform_infos.dart';

//import 'package:fcm_shared_isolate/fcm_shared_isolate.dart';

class NoTokenException implements Exception {
  String get cause => 'Cannot get firebase token';
}

class BackgroundPush {
  static final _instances = <Client, BackgroundPush>{};
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Client client;
  static MatrixState? matrix;
  String? _fcmToken;
  static void Function(String errorMsg, {Uri? link})? onFcmError;
  L10n? l10n;

  Future<void> loadLocale() async {
    final context = matrix?.context;
    // inspired by _lookupL10n in .dart_tool/flutter_gen/gen_l10n/l10n.dart
    l10n ??= (context != null ? L10n.of(context) : null) ??
        (await L10n.delegate.load(PlatformDispatcher.instance.locale));
  }

  final pendingTests = <String, Completer<void>>{};

  final dynamic firebase = null; //FcmSharedIsolate();

  DateTime? lastReceivedPush;

  bool upAction = false;

  void _init() async {
    try {
      await _flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('notifications_icon'),
          iOS: DarwinInitializationSettings(),
        ),
        onDidReceiveNotificationResponse: goToRoom,
      );
      Logs().v('Flutter Local Notifications initialized');
      firebase?.setListeners(
        onMessage: (message) => pushHelper(
          PushNotification.fromJson(
            Map<String, dynamic>.from(message['data'] ?? message),
          ),
          client: client,
          l10n: l10n,
          activeRoomId: matrix?.activeRoomId,
          flutterLocalNotificationsPlugin: _flutterLocalNotificationsPlugin,
        ),
      );
      if (Platform.isAndroid) {
        await UnifiedPush.initialize(
          onNewEndpoint: _newUpEndpoint,
          onRegistrationFailed: _upUnregistered,
          onUnregistered: _upUnregistered,
          onMessage: _onUpMessage,
        );
      }
    } catch (e, s) {
      Logs().e('Unable to initialize Flutter local notifications', e, s);
    }
  }

  static void initInstancesClientsOnly(List<Client> clients) async {
    for (final c in clients) {
      _instances[c] ??= BackgroundPush._(c);
    }
  }

  BackgroundPush._(this.client) {
    Logs().d("Creating BackgroundPush for ${client.userID}");
    _init();
  }

  static void initInstances(
    MatrixState matrix,
    List<Client> clients, {
    final void Function(String errorMsg, {Uri? link})? onFcmError,
  }) {
    BackgroundPush.initInstancesClientsOnly(clients);
    BackgroundPush.matrix = matrix;
    // ignore: prefer_initializing_formals
    BackgroundPush.onFcmError = onFcmError;
  }

  Future<void> cancelNotification(String roomId) async {
    Logs().v('Cancel notification for room', roomId);
    await _flutterLocalNotificationsPlugin.cancel(roomId.hashCode);

    // Workaround for app icon badge not updating
    if (Platform.isIOS) {
      final unreadCount = client.rooms
          .where((room) => room.isUnreadOrInvited && room.id != roomId)
          .length;
      if (unreadCount == 0) {
        FlutterAppBadger.removeBadge();
      } else {
        FlutterAppBadger.updateBadgeCount(unreadCount);
      }
      return;
    }
  }

  Future<void> _setupPusher({
    String? gatewayUrl,
    String? token,
    Set<String?>? oldTokens,
    bool useDeviceSpecificAppId = false,
  }) async {
    if (PlatformInfos.isIOS) {
      await firebase?.requestPermission();
    } else if (PlatformInfos.isAndroid) {
      _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
    final clientName = PlatformInfos.clientName;
    oldTokens ??= <String>{};
    final pushers = await (client.getPushers().catchError((e) {
          Logs().w('[Push] Unable to request pushers', e);
          return <Pusher>[];
        })) ??
        [];
    var setNewPusher = false;
    // Just the plain app id, we add the .data_message suffix later
    var appId = AppConfig.pushNotificationsAppId;
    // we need the deviceAppId to remove potential legacy UP pusher
    var deviceAppId = '$appId.${client.deviceID}';
    // appId may only be up to 64 chars as per spec
    if (deviceAppId.length > 64) {
      deviceAppId = deviceAppId.substring(0, 64);
    }
    if (!useDeviceSpecificAppId && PlatformInfos.isAndroid) {
      appId += '.data_message';
    }
    final thisAppId = useDeviceSpecificAppId ? deviceAppId : appId;
    if (gatewayUrl != null && token != null) {
      final currentPushers = pushers.where((pusher) => pusher.pushkey == token);
      if (currentPushers.length == 1 &&
          currentPushers.first.kind == 'http' &&
          currentPushers.first.appId == thisAppId &&
          currentPushers.first.appDisplayName == clientName &&
          currentPushers.first.deviceDisplayName == client.deviceName &&
          currentPushers.first.lang == 'en' &&
          currentPushers.first.data.url.toString() == gatewayUrl &&
          currentPushers.first.data.format ==
              AppConfig.pushNotificationsPusherFormat &&
          mapEquals(
            currentPushers.single.data.additionalProperties,
            {"data_message": pusherDataMessageFormat},
          )) {
        Logs().i('[Push] Pusher already set');
      } else {
        Logs().i('Need to set new pusher');
        oldTokens.add(token);
        if (client.isLogged()) {
          setNewPusher = true;
        }
      }
    } else {
      Logs().w('[Push] Missing required push credentials');
    }
    for (final pusher in pushers) {
      if ((token != null &&
              pusher.pushkey != token &&
              deviceAppId == pusher.appId) ||
          oldTokens.contains(pusher.pushkey)) {
        try {
          await client.deletePusher(pusher);
          Logs().i('[Push] Removed legacy pusher for this device');
        } catch (err) {
          Logs().w('[Push] Failed to remove old pusher', err);
        }
      }
    }
    if (setNewPusher) {
      try {
        await client.postPusher(
          Pusher(
            pushkey: token!,
            appId: thisAppId,
            appDisplayName: clientName,
            deviceDisplayName: client.deviceName!,
            lang: 'en',
            data: PusherData(
              url: Uri.parse(gatewayUrl!),
              format: AppConfig.pushNotificationsPusherFormat,
              additionalProperties: {"data_message": pusherDataMessageFormat},
            ),
            kind: 'http',
          ),
          append: false,
        );
      } catch (e, s) {
        Logs().e('[Push] Unable to set pushers', e, s);
      }
    }
  }

  final pusherDataMessageFormat = Platform.isAndroid
      ? 'android'
      : Platform.isIOS
          ? 'ios'
          : null;

  static bool _wentToRoomOnStartup = false;

  static Future<void> setupPush() async {
    _instances.forEach((_, bp) {
      bp._setupPush();
    });
  }

  static BackgroundPush? getInstance(Client client) {
    return _instances[client];
  }

  Future<void> _setupPush() async {
    Logs().d("SetupPush for ${client.userID}");
    if (client.onLoginStateChanged.value != LoginState.loggedIn ||
        !PlatformInfos.isMobile ||
        matrix == null) {
      return;
    }
    // Do not setup unifiedpush if this has been initialized by
    // an unifiedpush action
    if (upAction) {
      return;
    }
    if (!PlatformInfos.isIOS &&
        (await UnifiedPush.getDistributors()).isNotEmpty) {
      await _setupUp();
    } else {
      await _setupFirebase();
    }

    // ignore: unawaited_futures
    _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails()
        .then((details) {
      if (details == null ||
          !details.didNotificationLaunchApp ||
          _wentToRoomOnStartup) {
        return;
      }
      _wentToRoomOnStartup = true;
      goToRoom(details.notificationResponse);
    });
  }

  Future<void> _noFcmWarning() async {
    if (matrix == null) {
      return;
    }
    if ((matrix?.store.getBool(SettingKeys.showNoGoogle) ?? false) == true) {
      return;
    }
    await loadLocale();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (PlatformInfos.isAndroid) {
        onFcmError?.call(
          l10n!.noGoogleServicesWarning,
          link: Uri.parse(
            AppConfig.enablePushTutorial,
          ),
        );
        return;
      }
      onFcmError?.call(l10n!.oopsPushError);
    });
  }

  Future<void> _setupFirebase() async {
    Logs().v('Setup firebase');
    if (_fcmToken?.isEmpty ?? true) {
      try {
        _fcmToken = await firebase?.getToken();
        if (_fcmToken == null) throw ('PushToken is null');
      } catch (e, s) {
        Logs().w('[Push] cannot get token', e, e is String ? null : s);
        await _noFcmWarning();
        return;
      }
    }
    await _setupPusher(
      gatewayUrl: AppConfig.pushNotificationsGatewayUrl,
      token: _fcmToken,
    );
  }

  Future<void> goToRoom(NotificationResponse? response) async {
    try {
      final roomId = response?.payload;
      Logs().v('[Push] Attempting to go to room $roomId...');
      if (roomId == null) {
        return;
      }
      await client.roomsLoading;
      await client.accountDataLoading;
      FluffyChatApp.router.go(
        client.getRoomById(roomId)?.membership == Membership.invite
            ? '/rooms'
            : '/rooms/$roomId',
      );
    } catch (e, s) {
      Logs().e('[Push] Failed to open room', e, s);
    }
  }

  Future<void> _setupUp() async {
    final id = client.userID ?? "default";
    await UnifiedPushUi(matrix!.context, [id], UPFunctions())
        .registerAppWithDialog();
  }

  Future<void> _newUpEndpoint(String newEndpoint, String i) async {
    upAction = true;
    if (newEndpoint.isEmpty) {
      await _upUnregistered(i);
      return;
    }
    var endpoint =
        'https://matrix.gateway.unifiedpush.org/_matrix/push/v1/notify';
    try {
      final url = Uri.parse(newEndpoint)
          .replace(
            path: '/_matrix/push/v1/notify',
            query: '',
          )
          .toString()
          .split('?')
          .first;
      final res =
          json.decode(utf8.decode((await http.get(Uri.parse(url))).bodyBytes));
      if (res['gateway'] == 'matrix' ||
          (res['unifiedpush'] is Map &&
              res['unifiedpush']['gateway'] == 'matrix')) {
        endpoint = url;
      }
    } catch (e) {
      Logs().i(
        '[Push] No self-hosted unified push gateway present: $newEndpoint',
      );
    }
    Logs().i('[Push] UnifiedPush using endpoint $endpoint');
    final oldTokens = <String?>{};
    try {
      final fcmToken = await firebase?.getToken();
      oldTokens.add(fcmToken);
    } catch (_) {}
    await _setupPusher(
      gatewayUrl: endpoint,
      token: newEndpoint,
      oldTokens: oldTokens,
      useDeviceSpecificAppId: true,
    );
    await client.updateApplicationAccountConfig(
      ApplicationAccountConfig(
        unifiedPushEndpoint: newEndpoint,
        unifiedPushRegistered: true,
      ),
    );
  }

  Future<void> _upUnregistered(String i) async {
    upAction = true;
    Logs().i('[Push] Removing UnifiedPush endpoint...');
    final oldEndpoint = client.applicationAccountConfig.unifiedPushEndpoint;
    await client.updateApplicationAccountConfig(
      const ApplicationAccountConfig(
        unifiedPushEndpoint: "",
        unifiedPushRegistered: false,
      ),
    );
    if (oldEndpoint?.isNotEmpty ?? false) {
      // remove the old pusher
      await _setupPusher(
        oldTokens: {oldEndpoint},
      );
    }
  }

  Future<void> _onUpMessage(Uint8List message, String i) async {
    upAction = true;
    final data = Map<String, dynamic>.from(
      json.decode(utf8.decode(message))['notification'],
    );
    // UP may strip the devices list
    data['devices'] ??= [];
    await pushHelper(
      PushNotification.fromJson(data),
      client: client,
      l10n: l10n,
      activeRoomId: matrix?.activeRoomId,
      flutterLocalNotificationsPlugin: _flutterLocalNotificationsPlugin,
    );
  }
}

class UPFunctions extends UnifiedPushFunctions {
  final List<String> features = [/*list of features*/];
  @override
  Future<String?> getDistributor() async {
    return await UnifiedPush.getDistributor();
  }

  @override
  Future<List<String>> getDistributors() async {
    return await UnifiedPush.getDistributors(features);
  }

  @override
  Future<void> registerApp(String instance) async {
    await UnifiedPush.registerApp(instance, features);
  }

  @override
  Future<void> saveDistributor(String distributor) async {
    await UnifiedPush.saveDistributor(distributor);
  }
}
