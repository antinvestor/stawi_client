import 'package:flutter/material.dart';

import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:matrix/matrix.dart';

import 'package:fluffychat/config/app_config.dart';
import 'package:fluffychat/pages/image_viewer/image_viewer.dart';
import 'package:fluffychat/widgets/mxc_image.dart';

class ImageBubble extends StatelessWidget {
  final Event event;
  final bool tapToView;
  final BoxFit fit;
  final bool maxSize;
  final Color? backgroundColor;
  final bool thumbnailOnly;
  final bool animated;
  final double width;
  final double height;
  final void Function()? onTap;
  final BorderRadius? borderRadius;
  final Color? watermarkColor;

  const ImageBubble(
    this.event, {
    this.tapToView = true,
    this.maxSize = true,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.thumbnailOnly = true,
    this.width = 400,
    this.height = 300,
    this.animated = false,
    this.watermarkColor,
    this.onTap,
    this.borderRadius,
    super.key,
  });

  Widget _buildPlaceholder(BuildContext context) {
    if (event.messageType == MessageTypes.Sticker) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    final String blurHashString =
        event.infoMap['xyz.amorgan.blurhash'] is String
            ? event.infoMap['xyz.amorgan.blurhash']
            : 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';
    final ratio = event.infoMap['w'] is int && event.infoMap['h'] is int
        ? event.infoMap['w'] / event.infoMap['h']
        : 1.0;
    var width = 32;
    var height = 32;
    if (ratio > 1.0) {
      height = (width / ratio).round();
      if (height <= 0) height = 1;
    } else {
      width = (height * ratio).round();
      if (width <= 0) width = 1;
    }
    return SizedBox(
      width: this.width,
      height: this.height,
      child: BlurHash(
        hash: blurHashString,
        decodingWidth: width,
        decodingHeight: height,
        imageFit: fit,
      ),
    );
  }

  void _onTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }
    if (!tapToView) return;
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => ImageViewer(event),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius =
        this.borderRadius ?? BorderRadius.circular(AppConfig.borderRadius);
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: InkWell(
        onTap: () => _onTap(context),
        borderRadius: borderRadius,
        child: Hero(
          tag: event.eventId,
          child: ConstrainedBox(
            constraints: maxSize
                ? BoxConstraints(
                    maxWidth: width,
                    maxHeight: height,
                  )
                : const BoxConstraints.expand(),
            child: MxcImage(
              key: ValueKey(event.eventId),
              event: event,
              width: width,
              height: height,
              fit: fit,
              animated: animated,
              disableTapHandler: true,
              isThumbnail: thumbnailOnly,
              placeholder: _buildPlaceholder,
              watermarkSize: width / 2.5,
              watermarkColor: watermarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
