import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:matrix/matrix.dart';
import 'package:stawi/config/app_config.dart';
import 'package:stawi/l10n/l10n.dart';
import 'package:stawi/pages/finance/widgets/account_balance_view.dart';
import 'package:stawi/services/default/event_type.dart';
import 'package:stawi/services/stawi/event_service.dart';
import 'package:stawi/services/stawi/payloads/response_payloads.dart';
import 'package:stawi/utils/date_time_extension.dart';
import 'package:stawi/utils/fluffy_share.dart';
import 'package:stawi/utils/url_launcher.dart';
import 'package:stawi/widgets/avatar.dart';
import 'package:stawi/widgets/presence_builder.dart';
import 'package:stawi/widgets/qr_code_viewer.dart';

import '../../widgets/matrix.dart';
import 'user_bottom_sheet.dart';

class UserBottomSheetView extends StatelessWidget {
  final UserBottomSheetController controller;

  const UserBottomSheetView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final user = controller.widget.user;
    final profile = controller.widget.profile;
    final profileContacts = profile?.contacts ?? List.empty();
    final userId = user?.id ?? profile?.userId ?? '';
    final displayname =
        (user?.calcDisplayname() ??
            profile?.displayName ??
            profile?.userId?.localpart)!;

    final avatarUrl = user?.avatarUrl ?? profile?.avatarUrl;

    final client = Matrix.of(controller.widget.outerContext).client;
    final profileSearchError = controller.widget.profileSearchError;
    final dmRoomId = client.getDirectChatFromUserId(userId);
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: CloseButton(
            onPressed: Navigator.of(context, rootNavigator: false).pop,
          ),
        ),
        centerTitle: false,
        title: Text(displayname),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: () => showQrCodeViewer(context, userId),
              icon: const Icon(Icons.qr_code_outlined),
            ),
          ),
        ],
      ),
      body: StreamBuilder<Object>(
        stream: user?.room.client.onSync.stream.where(
          (syncUpdate) =>
              syncUpdate.rooms?.join?[user.room.id]?.timeline?.events?.any(
                (state) => state.type == EventTypes.RoomPowerLevels,
              ) ??
              false,
        ),
        builder: (context, snapshot) {
          final theme = Theme.of(context);
          return ListView(
            children: [
              if (user?.membership == Membership.knock)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                    color: theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                    child: ListTile(
                      minVerticalPadding: 16,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          L10n.of(
                            context,
                          ).userWouldLikeToChangeTheChat(displayname),
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: theme.colorScheme.surface,
                              foregroundColor: theme.colorScheme.primary,
                              iconColor: theme.colorScheme.primary,
                            ),
                            onPressed: controller.knockAccept,
                            icon: const Icon(Icons.check_outlined),
                            label: Text(L10n.of(context).accept),
                          ),
                          const SizedBox(width: 12),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: theme.colorScheme.errorContainer,
                              foregroundColor:
                                  theme.colorScheme.onErrorContainer,
                              iconColor: theme.colorScheme.onErrorContainer,
                            ),
                            onPressed: controller.knockDecline,
                            icon: const Icon(Icons.cancel_outlined),
                            label: Text(L10n.of(context).decline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Avatar(
                      client: Matrix.of(controller.widget.outerContext).client,
                      mxContent: avatarUrl,
                      name: displayname,
                      size: Avatar.defaultSize * 2.5,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...profileContacts.map((contact) {
                          return TextButton.icon(
                            onPressed:
                                () => FluffyShare.share(
                                  contact.detail ?? '',
                                  context,
                                  copyOnly: true,
                                ),
                            icon: const Icon(Icons.copy_outlined, size: 14),
                            style: TextButton.styleFrom(
                              foregroundColor: theme.colorScheme.onSurface,
                              iconColor: theme.colorScheme.onSurface,
                            ),
                            label: Text(
                              contact.detail ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }),

                        PresenceBuilder(
                          userId: userId,
                          client: client,
                          builder: (context, presence) {
                            if (presence == null ||
                                (presence.presence == PresenceType.offline &&
                                    presence.lastActiveTimestamp == null)) {
                              return const SizedBox.shrink();
                            }

                            final dotColor =
                                presence.presence.isOnline
                                    ? Colors.green
                                    : presence.presence.isUnavailable
                                    ? Colors.orange
                                    : Colors.grey;

                            final lastActiveTimestamp =
                                presence.lastActiveTimestamp;

                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 16),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: dotColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                if (presence.currentlyActive == true)
                                  Text(
                                    L10n.of(context).currentlyActive,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall,
                                  )
                                else if (lastActiveTimestamp != null)
                                  Text(
                                    L10n.of(context).lastActiveAgo(
                                      lastActiveTimestamp.localizedTimeShort(
                                        context,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall,
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              PresenceBuilder(
                userId: userId,
                client: client,
                builder: (context, presence) {
                  final status = presence?.statusMsg;
                  if (status == null || status.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return ListTile(
                    title: SelectableLinkify(
                      text: status,
                      style: const TextStyle(fontSize: 16),
                      options: const LinkifyOptions(humanize: false),
                      linkStyle: const TextStyle(
                        color: Colors.blueAccent,
                        decorationColor: Colors.blueAccent,
                      ),
                      onOpen:
                          (url) => UrlLauncher(context, url.url).launchUrl(),
                    ),
                  );
                },
              ),
              if (userId.isEmpty || userId != client.userID)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ElevatedButton.icon(
                    onPressed:
                        () => controller.participantAction(
                          userId.isEmpty
                              ? UserBottomSheetAction.invite
                              : UserBottomSheetAction.message,
                        ),
                    icon: const Icon(Icons.forum_outlined),
                    label: Text(
                      userId.isEmpty
                          ? L10n.of(context).invite
                          : (dmRoomId == null
                              ? L10n.of(context).startConversation
                              : L10n.of(context).sendAMessage),
                    ),
                  ),
                ),
              // Account balance view - only show if user is from a room context
              if (userId.isNotEmpty && controller.widget.user?.room != null)
                FutureBuilder<LedgerAccountState?>(
                  future: StawiEventService.getRoomStateEvent(
                    client: client,
                    roomId: controller.widget.user!.room.id,
                    eventType: StawiEventState.ledgerAccounts,
                    stateKey: userId,
                    fromJsonFactory: LedgerAccountState.fromJson,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }

                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.accounts.isNotEmpty) {
                      return AccountBalanceView(
                        ledgerState: snapshot.data!,
                        onTap: null,
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              if (controller.widget.onMention != null)
                ListTile(
                  leading: const Icon(Icons.alternate_email_outlined),
                  title: Text(L10n.of(context).mention),
                  onTap:
                      () => controller.participantAction(
                        UserBottomSheetAction.mention,
                      ),
                ),
              if (user != null) ...[
                Divider(color: theme.dividerColor),
                ListTile(
                  title: Text(L10n.of(context).userRole),
                  leading: const Icon(Icons.admin_panel_settings_outlined),
                  trailing: Material(
                    borderRadius: BorderRadius.circular(
                      AppConfig.borderRadius / 2,
                    ),
                    color: theme.colorScheme.onInverseSurface,
                    child: DropdownButton<int>(
                      onChanged:
                          user.canChangeUserPowerLevel ||
                                  // Workaround until https://github.com/famedly/matrix-dart-sdk/pull/1765
                                  (user.room.canChangePowerLevel &&
                                      user.id == user.room.client.userID)
                              ? controller.setPowerLevel
                              : null,
                      value:
                          {0, 50, 100}.contains(user.powerLevel)
                              ? user.powerLevel
                              : null,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      borderRadius: BorderRadius.circular(
                        AppConfig.borderRadius / 2,
                      ),
                      underline: const SizedBox.shrink(),
                      items: [
                        DropdownMenuItem(
                          value: 0,
                          child: Text(
                            L10n.of(context).userLevel(
                              user.powerLevel < 50 ? user.powerLevel : 0,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 50,
                          child: Text(
                            L10n.of(context).moderatorLevel(
                              user.powerLevel >= 50 && user.powerLevel < 100
                                  ? user.powerLevel
                                  : 50,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 100,
                          child: Text(
                            L10n.of(context).adminLevel(
                              user.powerLevel >= 100 ? user.powerLevel : 100,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: null,
                          child: Text(L10n.of(context).custom),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              Divider(color: theme.dividerColor),
              if (user != null && user.canKick)
                ListTile(
                  textColor: theme.colorScheme.error,
                  iconColor: theme.colorScheme.error,
                  title: Text(L10n.of(context).kickFromChat),
                  leading: const Icon(Icons.exit_to_app_outlined),
                  onTap:
                      () => controller.participantAction(
                        UserBottomSheetAction.kick,
                      ),
                ),
              if (user != null &&
                  user.canBan &&
                  user.membership != Membership.ban)
                ListTile(
                  textColor: theme.colorScheme.onErrorContainer,
                  iconColor: theme.colorScheme.onErrorContainer,
                  title: Text(L10n.of(context).banFromChat),
                  leading: const Icon(Icons.warning_sharp),
                  onTap:
                      () => controller.participantAction(
                        UserBottomSheetAction.ban,
                      ),
                )
              else if (user != null &&
                  user.canBan &&
                  user.membership == Membership.ban)
                ListTile(
                  title: Text(L10n.of(context).unbanFromChat),
                  leading: const Icon(Icons.warning_outlined),
                  onTap:
                      () => controller.participantAction(
                        UserBottomSheetAction.unban,
                      ),
                ),
              if (user != null && user.id != client.userID)
                ListTile(
                  textColor: theme.colorScheme.onErrorContainer,
                  iconColor: theme.colorScheme.onErrorContainer,
                  title: Text(L10n.of(context).reportUser),
                  leading: const Icon(Icons.gavel_outlined),
                  onTap:
                      () => controller.participantAction(
                        UserBottomSheetAction.report,
                      ),
                ),
              if (profileSearchError != null)
                ListTile(
                  leading: const Icon(
                    Icons.warning_outlined,
                    color: Colors.orange,
                  ),
                  subtitle: Text(
                    L10n.of(context).profileNotFound,
                    style: const TextStyle(color: Colors.orange),
                  ),
                ),
              if (userId != client.userID &&
                  !client.ignoredUsers.contains(userId))
                ListTile(
                  textColor: theme.colorScheme.onErrorContainer,
                  iconColor: theme.colorScheme.onErrorContainer,
                  leading: const Icon(Icons.block_outlined),
                  title: Text(L10n.of(context).block),
                  onTap:
                      () => controller.participantAction(
                        UserBottomSheetAction.ignore,
                      ),
                ),
            ],
          );
        },
      ),
    );
  }
}
