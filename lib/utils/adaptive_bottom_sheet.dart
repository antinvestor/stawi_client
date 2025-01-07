import 'dart:math';

import 'package:chamamobile/config/app_config.dart';
import 'package:chamamobile/config/themes.dart';
import 'package:flutter/material.dart';

Future<T?> showAdaptiveBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isDismissible = true,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
}) {
  final maxHeight = min(MediaQuery.of(context).size.height - 32, 600);
  final dialogMode = FluffyThemes.isColumnMode(context);
  return showModalBottomSheet(
    context: context,
    builder: (context) => Padding(
      padding: dialogMode
          ? const EdgeInsets.symmetric(vertical: 32.0)
          : EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: dialogMode
            ? BorderRadius.circular(AppConfig.borderRadius)
            : const BorderRadius.only(
                topLeft: Radius.circular(AppConfig.borderRadius),
                topRight: Radius.circular(AppConfig.borderRadius),
              ),
        child: builder(context),
      ),
    ),
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    constraints: BoxConstraints(
      maxHeight: maxHeight + (dialogMode ? 64 : 0),
      maxWidth: FluffyThemes.columnWidth * 1.25,
    ),
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.hardEdge,
  );
}
