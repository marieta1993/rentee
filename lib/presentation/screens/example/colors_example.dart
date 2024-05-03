import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:uikit/src/theme/rentee_colors.dart';

class ColorsExample extends StatelessWidget {
  const ColorsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Styleguide - Colors - Main',
            style: notoH1,
          ),
          18.heightBox,
          const Row(
            children: [
              ColoredBox(
                color: RenteeColors.primary,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#3845ab'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.secondary,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#eea86c'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.tertiary,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#eea86c'),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              ColoredBox(
                color: RenteeColors.accent1,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#332c5a'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.accent2,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('82a4d0'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.accent3,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#fef4ee'),
                ),
              ),
            ],
          ),
          18.heightBox,
          Text(
            'Styleguide - Colors - Additional',
            style: notoH1,
          ),
          18.heightBox,
          const Row(
            children: [
              ColoredBox(
                color: RenteeColors.additional1,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#1F1F39'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.additional2,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#38385e'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.additional3,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#78829D'),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              ColoredBox(
                color: RenteeColors.additional4,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#B1B8C7'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.additional5,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#F3F6FD'),
                ),
              ),
              ColoredBox(
                color: RenteeColors.additional6,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#F9F9FB'),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              ColoredBox(
                color: RenteeColors.additional7,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('#ffffff'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
