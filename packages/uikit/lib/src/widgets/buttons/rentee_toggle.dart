import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uikit/uikit.dart';

class RenteeToggle extends StatelessWidget {
  final bool value;
  final VoidCallback? onChanged;

  const RenteeToggle({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onChanged,
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: 40,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: borderRounded8,
              color: value ? RenteeColors.primary : RenteeColors.additional5,
            ),
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: paddingAll4,
                decoration: BoxDecoration(
                  borderRadius: borderRounded4,
                  color: value
                      ? RenteeColors.additional5
                      : RenteeColors.additional4,
                ),
                width: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
