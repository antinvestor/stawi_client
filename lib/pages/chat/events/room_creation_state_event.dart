import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:stawi/config/app_config.dart';
import 'package:stawi/l10n/l10n.dart';
import 'package:stawi/utils/date_time_extension.dart';
import 'package:stawi/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:stawi/widgets/avatar.dart';

class RoomCreationStateEvent extends StatelessWidget {
  final Event event;
  const RoomCreationStateEvent({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final matrixLocals = MatrixLocals(l10n);
    final theme = Theme.of(context);
    final roomName = event.room.getLocalizedDisplayname(matrixLocals);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Center(
        child: Material(
          color: theme.colorScheme.surface.withAlpha(128),
          borderRadius: BorderRadius.circular(AppConfig.borderRadius),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Avatar(
                  mxContent: event.room.avatar,
                  name: roomName,
                  size: Avatar.defaultSize * 2,
                ),
                Text(roomName, style: theme.textTheme.headlineSmall),
                Text(
                  '${event.originServerTs.localizedTime(context)} | ${l10n.countParticipants((event.room.summary.mJoinedMemberCount ?? 1) + (event.room.summary.mInvitedMemberCount ?? 0))}',
                  style: theme.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
