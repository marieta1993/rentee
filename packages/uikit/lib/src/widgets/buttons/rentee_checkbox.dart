import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_border_styles.dart';
import 'package:uikit/src/theme/rentee_colors.dart';

class CheckBox extends StatefulWidget {
  final bool checkValue;
  final ValueChanged<bool?>? checkCallBack;
  const CheckBox({
    super.key,
    required this.checkValue,
    required this.checkCallBack,
  });

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.checkValue,
      onChanged: widget.checkCallBack,
      activeColor: RenteeColors.primary,
      shape: RoundedRectangleBorder(borderRadius: borderRounded4),
    );
  }
}
