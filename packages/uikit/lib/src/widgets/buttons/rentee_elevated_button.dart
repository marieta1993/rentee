import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_button_styles.dart';

class RenteeElevatedButton extends StatelessWidget {
  final bool isSecondary;
  final bool isGray;
  final bool isTertiary;
  final String text;
  final VoidCallback? onPress;
  final IconData? icon;

  const RenteeElevatedButton(
      {required this.text, this.icon, this.onPress, super.key})
      : isGray = false,
        isSecondary = false,
        isTertiary = false;

  const RenteeElevatedButton.secondary({
    required this.text,
    this.onPress,
    this.icon,
    super.key,
  })  : isSecondary = true,
        isGray = false,
        isTertiary = false;

  const RenteeElevatedButton.gray(
      {required this.text, this.icon, this.onPress, super.key})
      : isSecondary = false,
        isTertiary = false,
        isGray = true;
  const RenteeElevatedButton.tertiary(
      {required this.text, this.icon, this.onPress, super.key})
      : isSecondary = false,
        isGray = false,
        isTertiary = true;

  @override
  Widget build(BuildContext context) {
    if (isSecondary) {
      return ElevatedButton(
        onPressed: onPress,
        style: secondaryButton,
        child: Text(text),
      );
    }
    if (isGray) {
      return ElevatedButton(
        onPressed: onPress,
        style: grayButton,
        child: Text(text),
      );
    }
    if (isTertiary) {
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
