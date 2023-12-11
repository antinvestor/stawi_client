import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:fluffychat/config/app_config.dart';

class ItShimmer extends StatelessWidget {
  const ItShimmer({super.key, required this.originalSpan});

  final String originalSpan;

  Iterable<Widget> renderShimmerIfListEmpty(
    BuildContext context, {
    int noOfBars = 3,
  }) {
    final List<String> dummyStrings = [];
    for (int i = 0; i < noOfBars; i++) {
      dummyStrings.add(originalSpan);
    }
    return dummyStrings.map(
      (e) => ITShimmerElement(
        text: e,
      ),
    );
  }

  // PTODO - bring this back, make it shimmer
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [...renderShimmerIfListEmpty(context, noOfBars: 3)],
    );
  }
}

class ITShimmerElement extends StatelessWidget {
  const ITShimmerElement({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 50),
      margin: const EdgeInsets.all(2),
      padding: EdgeInsets.zero,
      // decoration: BoxDecoration(
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      //   border: Border.all(
      //     color: Theme.of(context).colorScheme.primary,
      //     style: BorderStyle.solid,
      //     width: 2.0,
      //   ),
      // ),
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 7),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppConfig.primaryColor.withOpacity(0.2),
            ),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
