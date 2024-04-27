import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello',
                style: ptSerifH1,
              ),
              RenteeElevatedButton(
                text: 'Custom Button',
                onPress: () {},
              ),
              IconButton(onPressed: () {}, icon: RenteeAssets.icons.heart.svg()),
            ],
          ),
        ),
      ),
    );
  }
}
