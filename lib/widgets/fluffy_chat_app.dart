import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluffychat/config/routes.dart';
import 'package:fluffychat/config/themes.dart';
import 'package:fluffychat/utils/app_state.dart';
import 'package:fluffychat/utils/voip/voip_plugin.dart';
import 'package:fluffychat/widgets/app_lock.dart';
import 'package:fluffychat/widgets/theme_builder.dart';
import '../config/app_config.dart';
import '../utils/custom_scroll_behaviour.dart';
import 'matrix.dart';

class FluffyChatApp extends StatelessWidget {
  final Widget? testWidget;
  final List<Client> clients;
  final List<VoipPlugin> voipPlugins;
  final String? pincode;
  final SharedPreferences store;

  const FluffyChatApp({
    super.key,
    this.testWidget,
    required this.clients,
    required this.voipPlugins,
    required this.store,
    this.pincode,
  });

  /// getInitialLink may rereturn the value multiple times if this view is
  /// opened multiple times for example if the user logs out after they logged
  /// in with qr code or magic link.
  static bool gotInitialLink = false;

  // Router must be outside of build method so that hot reload does not reset
  // the current path.
  static final GoRouter router = GoRouter(routes: AppRoutes.routes);

  static final appGlobalKey = GlobalKey();

  static final appState = AppState();

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, themeMode, primaryColor) => MaterialApp.router(
        title: AppConfig.applicationName,
        themeMode: themeMode,
        theme: FluffyThemes.buildTheme(context, Brightness.light, primaryColor),
        darkTheme:
            FluffyThemes.buildTheme(context, Brightness.dark, primaryColor),
        scrollBehavior: CustomScrollBehavior(),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        routerConfig: router,
        builder: (context, child) {
          return ChangeNotifierProvider<AppState>.value(
            key: ValueKey(themeMode),
            value: appState,
            child: AppLockWidget(
              pincode: pincode,
              clients: clients,
              // Need a navigator above the Matrix widget for
              // displaying dialogs
              child: Navigator(
                onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (_) => Matrix(
                    key: appGlobalKey,
                    clients: clients,
                    voipPlugins: voipPlugins,
                    store: store,
                    child: testWidget ?? child,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
