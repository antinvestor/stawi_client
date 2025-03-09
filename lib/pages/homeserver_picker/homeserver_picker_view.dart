import 'package:chamamobile/widgets/layouts/login_scaffold.dart';
import 'package:chamamobile/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:chamamobile/l10n/l10n.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../config/themes.dart';
import 'homeserver_picker.dart';

class HomeserverPickerView extends StatelessWidget {
  final HomeserverPickerController controller;

  const HomeserverPickerView(
    this.controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LoginScaffold(
      enforceMobileMode: Matrix.of(context).client.isLogged(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(""),
        actions: [
          PopupMenuButton<MoreLoginActions>(
            onSelected: controller.onMoreAction,
            itemBuilder: (_) => [
              PopupMenuItem(
                value: MoreLoginActions.importBackup,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.import_export_outlined),
                    const SizedBox(width: 12),
                    Text(L10n.of(context).hydrate),
                  ],
                ),
              ),
              PopupMenuItem(
                value: MoreLoginActions.privacy,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.privacy_tip_outlined),
                    const SizedBox(width: 12),
                    Text(L10n.of(context).privacy),
                  ],
                ),
              ),
              PopupMenuItem(
                value: MoreLoginActions.about,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.info_outlined),
                    const SizedBox(width: 12),
                    Text(L10n.of(context).about),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // display a prominent banner to import session for TOR browser
                    // users. This feature is just some UX sugar as TOR users are
                    // usually forced to logout as TOR browser is non-persistent
                    AnimatedContainer(
                      height: controller.isTorBrowser ? 64 : 0,
                      duration: FluffyThemes.animationDuration,
                      curve: FluffyThemes.animationCurve,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(),
                      child: Material(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(8),
                        ),
                        color: theme.colorScheme.surface,
                        child: ListTile(
                          leading: const Icon(Icons.vpn_key),
                          title: Text(L10n.of(context).hydrateTor),
                          subtitle: Text(L10n.of(context).hydrateTorLong),
                          trailing: const Icon(Icons.chevron_right_outlined),
                          onTap: controller.restoreBackup,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Hero(
                        tag: 'info-logo',
                        child: Image.asset(
                          './assets/banner_transparent_black.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(height: 64),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: SelectableLinkify(
                        text: L10n.of(context).appIntroduction,
                        textAlign: TextAlign.center,
                        linkStyle: TextStyle(
                          color: theme.colorScheme.secondary,
                          decorationColor: theme.colorScheme.secondary,
                        ),
                        onOpen: (link) => launchUrlString(link.url),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 32),
                          controller.isLoading
                              ? const LinearProgressIndicator()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.colorScheme.primary,
                                    foregroundColor:
                                        theme.colorScheme.onPrimary,
                                  ),
                                  onPressed: controller.isLoading
                                      ? null
                                      : controller.checkHomeserverAction,
                                  child: Text(L10n.of(context).continueText),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
