import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_button_styles.dart';

enum RenteeElevatedButtonType {
  primary,
  secondary,
  gray,
  tertiary;

  ButtonStyle? get style {
    switch (this) {
      case RenteeElevatedButtonType.secondary:
        return secondaryButton;
      case RenteeElevatedButtonType.gray:
        return grayButton;
      case RenteeElevatedButtonType.tertiary:
        return tertiaryButton;
      default:
        return null;
    }
  }
}

class RenteeElevatedButton extends StatelessWidget {
  final RenteeElevatedButtonType type;
  final String text;
  final VoidCallback? onPress;
  final IconData? icon;

  const RenteeElevatedButton(
      {required this.text,
      this.icon,
      this.onPress,
      super.key,
      this.type = RenteeElevatedButtonType.primary});

  const RenteeElevatedButton.secondary({
    required this.text,
    this.onPress,
    this.icon,
    super.key,
  }) : type = RenteeElevatedButtonType.secondary;

  const RenteeElevatedButton.gray(
      {required this.text, this.icon, this.onPress, super.key})
      : type = RenteeElevatedButtonType.gray;

  const RenteeElevatedButton.tertiary(
      {required this.text, this.icon, this.onPress, super.key})
      : type = RenteeElevatedButtonType.tertiary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: type.style,
      child: Text(text),
    );
  }
}
