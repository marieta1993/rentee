// import 'package:flutter/material.dart';
// import 'package:uikit/uikit.dart';
//
// class RenteeRadioButton extends StatefulWidget {
//   final String label;
//   final String option;
//   const RenteeRadioButton(
//       {required this.label, required this.option, super.key});
//
//   @override
//   State<RenteeRadioButton> createState() => _RenteeRadioButtonState();
// }
//
// class _RenteeRadioButtonState extends State<RenteeRadioButton> {
//   int selectedOption = 1;
//   onChanged(value) {
//     setState(() {
//       selectedOption = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           widget.label,
//           style: notoH5.copyWith(color: RenteeColors.additional2),
//         ),
//         15.heightBox,
//         ListTile(
//           title: Text(
//             widget.option,
//             style: notoP2.copyWith(color: RenteeColors.additional2),
//           ),
//           leading: Radio<int>(
//             value: 0,
//             groupValue: selectedOption,
//             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             fillColor: MaterialStateProperty.all(RenteeColors.primary),
//             splashRadius: 12,
//             overlayColor: MaterialStateProperty.all(RenteeColors.secondary),
//             onChanged: (value) {
//               onChanged(value);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class RenteeRadioButton extends StatefulWidget {
  final String? label;
  final String? option;
  final int value;
  final int selectedValue;
  final ValueChanged<int> onChanged;

  const RenteeRadioButton({
    this.label,
    this.option,
    super.key,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  State<RenteeRadioButton> createState() => _RenteeRadioButtonState();
}

class _RenteeRadioButtonState extends State<RenteeRadioButton> {
  int selectedOption = 0;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedValue;
  }

  @override
  void didUpdateWidget(covariant RenteeRadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      selectedOption = widget.selectedValue;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var selected = widget.value == selectedOption;
    final radio = GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = widget.value;
        });
        widget.onChanged.call(selectedOption);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: selected ? RenteeColors.primary : RenteeColors.additional5,
          shape: BoxShape.circle,
          border: Border.all(color: RenteeColors.additional5, width: 3.0),
        ),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.label!,
              style: notoH5.copyWith(color: RenteeColors.additional2),
            ),
          ),
        if (widget.option != null)
          Row(children: [
            radio,
            8.widthBox,
            Text(
              widget.option!,
              style: notoP2.copyWith(color: RenteeColors.additional2),
            ),
          ])
        else
          radio
      ],
    );
  }
}
