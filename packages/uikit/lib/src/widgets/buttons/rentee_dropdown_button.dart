import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_border_styles.dart';
import 'package:uikit/uikit.dart';

class RenteeDropdownButton extends StatefulWidget {
  final List<DropdownMenuItem<String>> options;
  final String? placeholder;
  final String label;

  const RenteeDropdownButton(
      {required this.options,
      required this.label,
      this.placeholder,
      super.key});

  @override
  State<RenteeDropdownButton> createState() => _RenteeDropdownButtonState();
}

class _RenteeDropdownButtonState extends State<RenteeDropdownButton> {
  String? selectedItem;

  onChanged(value) {
    setState(() {
      selectedItem = value;
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
        DropdownButtonFormField(
            iconSize: 16,
            iconEnabledColor: RenteeColors.primary,
            decoration: InputDecoration(
              iconColor: RenteeColors.primary,
              hintText: widget.placeholder ?? 'Select',
              hintStyle: notoP2.copyWith(color: RenteeColors.additional1),
              enabledBorder: OutlineInputBorder(
                borderSide: inputBorder,
                borderRadius: circularRadius15,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: circularRadius15,
              ),
              filled: true,
              fillColor: RenteeColors.additional6,
            ),
            validator: (value) => value == null ? "Please select" : null,
            dropdownColor: RenteeColors.additional6,
            value: selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            items: widget.options),
      ],
    );
  }
}
