import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uikit/src/theme/rentee_colors.dart';

class RenteePageIndicator extends StatefulWidget {
  final controller;

  final pagesData;
  final int index;

  const RenteePageIndicator({
    this.pagesData,
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  State<RenteePageIndicator> createState() => _RenteePageIndicatorState();
}

class _RenteePageIndicatorState extends State<RenteePageIndicator> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      onDotClicked: (index) {
        setState(() {
          widget.controller.jumpToPage(index);
          if (mounted) setState(() {});
        });
      },
      controller: widget.controller,
      count: widget.pagesData.length,
      effect: const ExpandingDotsEffect(
        expansionFactor: 4,
        offset: 8.0,
        dotWidth: 16.0,
        spacing: 20.0,
        radius: 5.0,
        activeDotColor: RenteeColors.accent2,
        dotColor: RenteeColors.tertiary,
        strokeWidth: 1.0,
        paintStyle: PaintingStyle.fill,
      ),
    );
  }
}
