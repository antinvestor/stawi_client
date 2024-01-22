import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:tawkie/config/app_config.dart';
import 'package:tawkie/config/themes.dart';
import 'package:tawkie/pages/chat/send_file_dialog.dart';
import 'package:tawkie/utils/date_time_extension.dart';
import 'package:tawkie/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:tawkie/utils/room_status_extension.dart';
import 'package:tawkie/widgets/avatar.dart';
import 'package:tawkie/widgets/hover_builder.dart';
import 'package:tawkie/widgets/matrix.dart';

enum ArchivedRoomAction { delete, rejoin }

class ChatListItem extends StatelessWidget {
  final Room room;
  final bool activeChat;
  final bool selected;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function()? onForget;

  const ChatListItem(
    this.room, {
    this.activeChat = false,
    this.selected = false,
    this.onTap,
    this.onLongPress,
    this.onForget,
    super.key,
  });

  void clickAction(BuildContext context) async {
    if (onTap != null) return onTap!();
    if (activeChat) return;
    if (room.membership == Membership.invite) {
      final inviterId =
          room.getState(EventTypes.RoomMember, room.client.userID!)?.senderId;
      final inviteAction = await showModalActionSheet<InviteActions>(
        context: context,
        message: room.isDirectChat
            ? L10n.of(context)!.invitePrivateChat
            : L10n.of(context)!.inviteGroupChat,
        title: room.getLocalizedDisplayname(MatrixLocals(L10n.of(context)!)),
        actions: [
          SheetAction(
            key: InviteActions.accept,
            label: L10n.of(context)!.accept,
            icon: Icons.check_outlined,
            isDefaultAction: true,
          ),
          SheetAction(
            key: InviteActions.decline,
            label: L10n.of(context)!.decline,
            icon: Icons.close_outlined,
            isDestructiveAction: true,
          ),
          SheetAction(
            key: InviteActions.block,
            label: L10n.of(context)!.block,
            icon: Icons.block_outlined,
            isDestructiveAction: true,
          ),
        ],
      );
      if (inviteAction == null) return;
      if (inviteAction == InviteActions.block) {
        context.go('/rooms/settings/security/ignorelist', extra: inviterId);
        return;
      }
      if (inviteAction == InviteActions.decline) {
        await showFutureLoadingDialog(
          context: context,
          future: room.leave,
        );
        return;
      }
      final joinResult = await showFutureLoadingDialog(
        context: context,
        future: () async {
          final waitForRoom = room.client.waitForRoomInSync(
            room.id,
            join: true,
          );
          await room.join();
          await waitForRoom;
        },
      );
      if (joinResult.error != null) return;
    }

    if (room.membership == Membership.ban) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.of(context)!.youHaveBeenBannedFromThisChat),
        ),
      );
      return;
    }

    if (room.membership == Membership.leave) {
      context.go('/rooms/archive/${room.id}');
    }

    if (room.membership == Membership.join) {
      // Share content into this room
      final shareContent = Matrix.of(context).shareContent;
      if (shareContent != null) {
        final shareFile = shareContent.tryGet<MatrixFile>('file');
        if (shareContent.tryGet<String>('msgtype') ==
                'chat.fluffy.shared_file' &&
            shareFile != null) {
          await showDialog(
            context: context,
            useRootNavigator: false,
            builder: (c) => SendFileDialog(
              files: [shareFile],
              room: room,
            ),
          );
          Matrix.of(context).shareContent = null;
        } else {
          final consent = await showOkCancelAlertDialog(
            context: context,
            title: L10n.of(context)!.forward,
            message: L10n.of(context)!.forwardMessageTo(
              room.getLocalizedDisplayname(MatrixLocals(L10n.of(context)!)),
            ),
            okLabel: L10n.of(context)!.forward,
            cancelLabel: L10n.of(context)!.cancel,
          );
          if (consent == OkCancelResult.cancel) {
            Matrix.of(context).shareContent = null;
            return;
          }
          if (consent == OkCancelResult.ok) {
            room.sendEvent(shareContent);
            Matrix.of(context).shareContent = null;
          }
        }
      }

      context.go('/rooms/${room.id}');
    }
  }

  Future<void> archiveAction(BuildContext context) async {
    {
      if ([Membership.leave, Membership.ban].contains(room.membership)) {
        await showFutureLoadingDialog(
          context: context,
          future: () => room.forget(),
        );
        return;
      }
      final confirmed = await showOkCancelAlertDialog(
        useRootNavigator: false,
        context: context,
        title: L10n.of(context)!.areYouSure,
        okLabel: L10n.of(context)!.yes,
        cancelLabel: L10n.of(context)!.no,
        message: L10n.of(context)!.archiveRoomDescription,
      );
      if (confirmed == OkCancelResult.cancel) return;
      await showFutureLoadingDialog(
        context: context,
        future: () => room.leave(),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = room.pushRuleState != PushRuleState.notify;
    final typingText = room.getLocalizedTypingText(context);
    final lastEvent = room.lastEvent;
    final ownMessage = lastEvent?.senderId == Matrix.of(context).client.userID;
    final unread = room.isUnread || room.membership == Membership.invite;
    final unreadBubbleSize = unread || room.hasNewMessages
        ? room.notificationCount > 0
            ? 20.0
            : 14.0
        : 0.0;
    final hasNotifications = room.notificationCount > 0;
    final backgroundColor = selected
        ? Theme.of(context).colorScheme.primaryContainer
        : activeChat
            ? Theme.of(context).colorScheme.secondaryContainer
            : null;
    var displayname = room.getLocalizedDisplayname(
      MatrixLocals(L10n.of(context)!),
    );

    // Condition for checking displayName for the presence of social networks
    Future<List<dynamic>> loadRoomInfo() async {
      final displayNameBrut = room.getLocalizedDisplayname();
      Color? networkColor;
      Image? networkImage;

      if (displayNameBrut.contains('(FB)')) {
        networkColor = FluffyThemes.facebookColor;
        networkImage = Image.asset(
          'assets/facebook-messenger.png',
          color: networkColor,
          filterQuality: FilterQuality.high,
        );
        displayname = displayname.replaceAll('(FB)', ''); // Delete (FB)
      } else if (displayNameBrut.contains('(Instagram)')) {
        networkColor = FluffyThemes.instagramColor;
        networkImage = Image.asset(
          'assets/instagram.png',
          color: networkColor,
          filterQuality: FilterQuality.high,
        );
        displayname =
            displayname.replaceAll('(Instagram)', ''); // Delete (Instagram)
      } else if (displayNameBrut.contains('(WA)')) {
        networkColor = FluffyThemes.whatsAppColor;
        networkImage = Image.asset(
          'assets/whatsapp.png',
          color: networkColor,
          filterQuality: FilterQuality.high,
        );
        displayname = displayname.replaceAll('(WA)', ''); // Delete (WA)
      }

      return [networkColor, networkImage];
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 1,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(AppConfig.borderRadius),
        clipBehavior: Clip.hardEdge,
        color: backgroundColor,
        child: FutureBuilder(
          future: room.loadHeroUsers(),
          builder: (context, snapshot) => HoverBuilder(
            builder: (context, hovered) => ListTile(
              visualDensity: const VisualDensity(vertical: -0.5),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              onLongPress: onLongPress,
              leading: Avatar(
                mxContent: room.avatar,
                name: displayname,
                presenceUserId: room.directChatMatrixID,
                presenceBackgroundColor: backgroundColor,
              ),
              title: FutureBuilder<List<dynamic>>(
                future: loadRoomInfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    final networkColor = snapshot.data![0];
                    final networkImage = snapshot.data![1];
                    return Row(
                      children: <Widget>[
                        if (networkImage != null)
                          SizedBox(
                            height: 24.0, // to adjust height
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: networkImage,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            displayname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: unread
                                ? TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: networkColor)
                                : TextStyle(color: networkColor),
                          ),
                        ),
                        if (isMuted)
                          const Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Icon(
                              Icons.notifications_off_outlined,
                              size: 16,
                            ),
                          ),
                        if (room.isFavourite ||
                            room.membership == Membership.invite)
                          Padding(
                            padding: EdgeInsets.only(
                              right: hasNotifications ? 4.0 : 0.0,
                            ),
                            child: Icon(
                              Icons.push_pin,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        if (lastEvent != null &&
                            room.membership != Membership.invite)
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              lastEvent.originServerTs
                                  .localizedTimeShort(context),
                              style: TextStyle(
                                fontSize: 13,
                                color: unread
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (typingText.isEmpty &&
                      ownMessage &&
                      room.lastEvent!.status.isSending) ...[
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                    ),
                    const SizedBox(width: 4),
                  ],
                  AnimatedContainer(
                    width: typingText.isEmpty ? 0 : 18,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(),
                    duration: FluffyThemes.animationDuration,
                    curve: FluffyThemes.animationCurve,
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 14,
                    ),
                  ),
                  Expanded(
                    child: typingText.isNotEmpty
                        ? Text(
                            typingText,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            maxLines: 1,
                            softWrap: false,
                          )
                        : FutureBuilder<String>(
                            future: room.lastEvent?.calcLocalizedBody(
                                  MatrixLocals(L10n.of(context)!),
                                  hideReply: true,
                                  hideEdit: true,
                                  plaintextBody: true,
                                  removeMarkdown: true,
                                  withSenderNamePrefix: !room.isDirectChat ||
                                      room.directChatMatrixID !=
                                          room.lastEvent?.senderId,
                                ) ??
                                Future.value(L10n.of(context)!.emptyChat),
                            builder: (context, snapshot) {
                              return Text(
                                room.membership == Membership.invite
                                    ? room.isDirectChat
                                        ? L10n.of(context)!.invitePrivateChat
                                        : L10n.of(context)!.inviteGroupChat
                                    : snapshot.data ??
                                        room.lastEvent
                                            ?.calcLocalizedBodyFallback(
                                          MatrixLocals(L10n.of(context)!),
                                          hideReply: true,
                                          hideEdit: true,
                                          plaintextBody: true,
                                          removeMarkdown: true,
                                          withSenderNamePrefix:
                                              !room.isDirectChat ||
                                                  room.directChatMatrixID !=
                                                      room.lastEvent?.senderId,
                                        ) ??
                                        L10n.of(context)!.emptyChat,
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: unread ? FontWeight.w600 : null,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  decoration: room.lastEvent?.redacted == true
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedContainer(
                    duration: FluffyThemes.animationDuration,
                    curve: FluffyThemes.animationCurve,
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    height: unreadBubbleSize,
                    width: !hasNotifications && !unread && !room.hasNewMessages
                        ? 0
                        : (unreadBubbleSize - 9) *
                                room.notificationCount.toString().length +
                            9,
                    decoration: BoxDecoration(
                      color: room.highlightCount > 0 ||
                              room.membership == Membership.invite
                          ? Colors.red
                          : hasNotifications || room.markedUnread
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primaryContainer,
                      borderRadius:
                          BorderRadius.circular(AppConfig.borderRadius),
                    ),
                    child: Center(
                      child: hasNotifications
                          ? Text(
                              room.notificationCount.toString(),
                              style: TextStyle(
                                color: room.highlightCount > 0
                                    ? Colors.white
                                    : hasNotifications
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                fontSize: 13,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
              onTap: () => clickAction(context),
              trailing: onForget == null
                  ? hovered || selected
                      ? IconButton(
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          icon: Icon(
                            selected
                                ? Icons.check_circle
                                : Icons.check_circle_outlined,
                          ),
                          onPressed: onLongPress,
                        )
                      : null
                  : IconButton(
                      icon: const Icon(Icons.delete_outlined),
                      onPressed: onForget,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

enum InviteActions {
  accept,
  decline,
  block,
}
