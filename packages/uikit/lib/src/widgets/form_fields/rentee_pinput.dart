import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:uikit/uikit.dart';

class RenteePinPut extends StatefulWidget {
  const RenteePinPut({super.key, this.label, this.controller});
  final String? label;
  final TextEditingController? controller;
  final int length = 6;

  @override
  State<RenteePinPut> createState() => _RenteePinPutState();
}

class _RenteePinPutState extends State<RenteePinPut> {
  @override
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: notoP1.copyWith(
        color: RenteeColors.additional1,
      ),
      decoration: BoxDecoration(
        color: RenteeColors.additional6,
        borderRadius: circularRadius15,
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        widget.label ?? '',
        style: notoH5.copyWith(color: RenteeColors.additional2),
      ),
      15.heightBox,
      SizedBox(
        height: 50,
        child: Pinput(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          length: widget.length,
          controller: widget.controller,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          onCompleted: (pin) {
            setState(() => showError = pin != '5555');
          },
          focusedPinTheme: defaultPinTheme.copyWith(
            height: 56,
            width: 50,
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: borderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: errorColor,
              borderRadius: circularRadius15,
            ),
          ),
        ),
      )
    ]);
  }
}
