import 'package:flutter/material.dart';

class RenteeElevatedButton extends StatelessWidget {
  const RenteeElevatedButton({required this.text, this.onPress, super.key});
  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: Text(text));
  }
}
