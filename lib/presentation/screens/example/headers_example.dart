import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class HeadersExample extends StatelessWidget {
  const HeadersExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Headers',
            style: notoH1,
          ),
          18.heightBox,
          Text(
            'Noto Sans Font Family',
            style: notoH1,
          ),
          18.heightBox,
          Text(
            'Heading - 1 - Semi-bold',
            style: notoH1,
          ),
          18.heightBox,
          Text(
            'Heading - 2 - Semi-bold',
            style: notoH2,
          ),
          18.heightBox,
          Text(
            'Heading - 3 - Semi-bold',
            style: notoH3,
          ),
          18.heightBox,
          Text(
            'Heading - 3 - Bold',
            style: notoText,
          ),
          18.heightBox,
          Text(
            'Heading - 4 - Semi-bold',
            style: notoH4,
          ),
          18.heightBox,
          Text(
            'Heading - 5 - Semi-bold',
            style: notoH5,
          ),
          18.heightBox,
          18.heightBox,
          Text(
            'PT Serif Font Family',
            style: ptSerifH1,
          ),
          18.heightBox,
          Text(
            'Heading - 1 - Bold',
            style: ptSerifH1,
          ),
          18.heightBox,
          Text(
            'Heading - 2 - Bold',
            style: ptSerifH2,
          ),
          18.heightBox,
          Text(
            'Heading - 3 - Bold',
            style: ptSerifH3,
          ),
          18.heightBox,
          Text(
            'Heading - 4 - Bold',
            style: ptSerifH4,
          ),
          18.heightBox,
          Text(
            'Heading - 5 - Bold',
            style: ptSerifH5,
          ),
          18.heightBox,
          Text(
            'Paragraph - 1 - Regular',
            style: ptSerifP1,
          ),
          18.heightBox,
        ],
      ),
    );
  }
}
