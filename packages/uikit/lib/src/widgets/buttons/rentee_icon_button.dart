import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_button_styles.dart';
import 'package:uikit/uikit.dart';

enum RenteeIconButtonVariant {
  standard,
  password,
  search,
  filled,
  outlined,
  custom;

  ButtonStyle? get style {
    switch (this) {
      case RenteeIconButtonVariant.filled:
        return iconFilledButton;
      default:
        return null;
    }
  }
}

class RenteeIconButton extends StatelessWidget {
  final RenteeIconButtonVariant _variant;
  final String? text;
  final VoidCallback? onPress;
  final Widget icon;

  const RenteeIconButton({
    this.text,
    required this.icon,
    this.onPress,
    super.key,
  }) : _variant = RenteeIconButtonVariant.standard;

  RenteeIconButton.search({
    required this.text,
    this.onPress,
    super.key,
  })  : _variant = RenteeIconButtonVariant.search,
        icon = RenteeAssets.icons.search.svg();

  const RenteeIconButton.filled({
    this.text,
    required this.icon,
    this.onPress,
    super.key,
  }) : _variant = RenteeIconButtonVariant.filled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      style:
          _variant == RenteeIconButtonVariant.filled ? iconFilledButton : null,
      icon: icon,
    );
  }
}
