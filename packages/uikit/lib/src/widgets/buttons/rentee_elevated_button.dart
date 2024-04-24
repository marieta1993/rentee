import 'package:flutter/material.dart';

class RenteeElevatedButton extends StatelessWidget {
  RenteeElevatedButton({required this.buttonText, this.onPress, super.key});
  final buttonText;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: Text(buttonText));
  }
}
