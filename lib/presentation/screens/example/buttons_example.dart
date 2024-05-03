import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Buttons',
              style: ptSerifH1,
            ),
            18.heightBox,
            RenteeElevatedButton(
              text: 'Primary Button',
              onPress: () {},
            ),
            18.heightBox,
            RenteeElevatedButton.secondary(
                text: 'Secondary Button', onPress: () {}),
            18.heightBox,
            RenteeElevatedButton.gray(text: 'Gray Button', onPress: () {}),
            18.heightBox,
            RenteeElevatedButton.tertiary(
                text: 'Tertiary Button', onPress: () {}),
            18.heightBox,
            RenteeElevatedButton(
                text: '', onPress: () {}, icon: Icons.arrow_back),
          ],
        ),
      ),
    );
  }
}
