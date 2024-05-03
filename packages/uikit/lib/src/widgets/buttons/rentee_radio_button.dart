import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_colors.dart';
import 'package:uikit/uikit.dart';

class RenteeRadioButton extends StatefulWidget {
  final String label;
  final String option;
  const RenteeRadioButton(
      {required this.label, required this.option, super.key});

  @override
  State<RenteeRadioButton> createState() => _RenteeRadioButtonState();
}

class _RenteeRadioButtonState extends State<RenteeRadioButton> {
  int selectedOption = 1;
  onChanged(value) {
    setState(() {
      selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label,
          style: notoH5.copyWith(color: RenteeColors.additional2),
        ),
        15.heightBox,
        ListTile(
          title: Text(
            widget.option,
            style: notoP2.copyWith(color: RenteeColors.additional2),
          ),
          leading: Radio<int>(
            value: 0,
            groupValue: selectedOption,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fillColor: MaterialStateProperty.all(RenteeColors.primary),
            overlayColor: MaterialStateProperty.all(RenteeColors.secondary),
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
