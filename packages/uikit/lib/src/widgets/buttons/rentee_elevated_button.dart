import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_button_styles.dart';

class RenteeElevatedButton extends StatelessWidget {
  bool _isSecondary = false;
  bool _isGray = false;
  bool _isTertiary = false;
  final String text;
  final VoidCallback? onPress;
  final IconData? icon;

  RenteeElevatedButton(
      {required this.text, this.icon, this.onPress, super.key});

  RenteeElevatedButton.secondary({
    required this.text,
    this.onPress,
    this.icon,
    super.key,
  }) {
    _isSecondary = true;
  }
  RenteeElevatedButton.gray(
      {required this.text, this.icon, this.onPress, super.key}) {
    _isGray = true;
  }
  RenteeElevatedButton.tertiary(
      {required this.text, this.icon, this.onPress, super.key}) {
    _isTertiary = true;
  }
  @override
  Widget build(BuildContext context) {
    if (_isSecondary) {
      return ElevatedButton(
        onPressed: onPress,
        style: secondaryButton,
        child: Text(text),
      );
    }
    if (_isGray) {
      return ElevatedButton(
        onPressed: onPress,
        style: grayButton,
        child: Text(text),
      );
    }
    if (_isTertiary) {
      return ElevatedButton(
        onPressed: onPress,
        style: tertiaryButton,
        child: Text(text),
      );
    }
    if (icon != null) {
      return IconButton.outlined(
        onPressed: onPress,
        icon: Icon(icon),
        style: iconButton,
      );
    }
    return ElevatedButton(onPressed: onPress, child: Text(text));
  }
}
