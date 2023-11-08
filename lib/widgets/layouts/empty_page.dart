import 'dart:math';

import 'package:fluffychat/pages/chat_list/add_chat_network.dart';
import 'package:flutter/material.dart';

import '../../utils/platform_infos.dart';

class EmptyPage extends StatelessWidget {
  final bool loading;
  static const double _width = 300;
  const EmptyPage({this.loading = false, super.key});
  @override
  Widget build(BuildContext context) {
    final width = min(MediaQuery.of(context).size.width, EmptyPage._width) / 2;
    return Scaffold(
      // Add invisible appbar to make status bar on Android tablets bright.
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'info-logo',
              child: Image.asset(
                'assets/favicon.png',
                width: width,
                height: width,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ),
          if (loading)
            Center(
              child: SizedBox(
                width: width,
                child: const LinearProgressIndicator(),
              ),
            ),

          // Button for add bridge when no conversation
          if(PlatformInfos.isWeb)
            const AddChatNetwork(),
        ],
      ),
    );
  }
}
