import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:fluffychat/config/themes.dart';
import 'package:fluffychat/pages/chat/sticker_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'chat.dart';

class ChatEmojiPicker extends StatelessWidget {
  final ChatController controller;
  const ChatEmojiPicker(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // #Pangea
    final bool lightMode = Theme.of(context).brightness == Brightness.light;
    // Pangea#
    return AnimatedContainer(
      duration: FluffyThemes.animationDuration,
      curve: FluffyThemes.animationCurve,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      height: controller.showEmojiPicker
          ? MediaQuery.of(context).size.height / 2
          : 0,
      child: controller.showEmojiPicker
          ?
          // #Pangea
          Stack(
              children: [
                // Pangea#
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: L10n.of(context)!.emojis),
                          Tab(text: L10n.of(context)!.stickers),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            EmojiPicker(
                              onEmojiSelected: controller.onEmojiSelected,
                              onBackspacePressed:
                                  controller.emojiPickerBackspace,
                              config: Config(
                                emojiViewConfig: EmojiViewConfig(
                                  noRecents: const NoRecent(),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface,
                                ),
                                bottomActionBarConfig:
                                    const BottomActionBarConfig(
                                  enabled: false,
                                ),
                                categoryViewConfig: CategoryViewConfig(
                                  backspaceColor: theme.colorScheme.primary,
                                  iconColor: theme.colorScheme.primary
                                      .withOpacity(0.5),
                                  iconColorSelected: theme.colorScheme.primary,
                                  indicatorColor: theme.colorScheme.primary,
                                ),
                                skinToneConfig: SkinToneConfig(
                                  dialogBackgroundColor: Color.lerp(
                                    theme.colorScheme.surface,
                                    theme.colorScheme.primaryContainer,
                                    0.75,
                                  )!,
                                  indicatorColor: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            StickerPickerDialog(
                              room: controller.room,
                              onSelected: (sticker) {
                                controller.room.sendEvent(
                                  {
                                    'body': sticker.body,
                                    'info': sticker.info ?? {},
                                    'url': sticker.url.toString(),
                                  },
                                  type: EventTypes.Sticker,
                                );
                                controller.hideEmojiPicker();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // #Pangea
                // Close button placed at bottom of emoji picker
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: controller.hideEmojiPicker,
                        backgroundColor: lightMode
                            ? const Color.fromARGB(255, 211, 211, 211)
                            : Colors.black,
                        shape: const CircleBorder(),
                        heroTag: null,
                        mini: true,
                        child: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // Pangea#
              ],
            )
          : null,
    );
  }
}

class NoRecent extends StatelessWidget {
  const NoRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      L10n.of(context)!.emoteKeyboardNoRecents,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
