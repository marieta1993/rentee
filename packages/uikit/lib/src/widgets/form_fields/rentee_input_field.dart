import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_border_styles.dart';
import 'package:uikit/uikit.dart';

class RenteeInputField extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final Widget? icon;
  final bool isSecure;
  final VoidCallback? suffixOnPressed;

  const RenteeInputField({
    this.label,
    this.icon,
    this.placeholder = 'Your placeholder',
    this.suffixOnPressed,
    super.key,
  }) : isSecure = false;

  const RenteeInputField.password({
    this.label,
    this.icon,
    this.placeholder = 'Your placeholder',
    this.suffixOnPressed,
    super.key,
  }) : isSecure = true;

  @override
  State<RenteeInputField> createState() => _RenteeInputFieldState();
}

class _RenteeInputFieldState extends State<RenteeInputField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    var passwordIcon = InkWell(
      onTap: passwordOnPress,
      child: Padding(
        padding: paddingOnlyEnd8,
        child: passwordVisible
            ? RenteeAssets.icons.hide.svg()
            : RenteeAssets.icons.show.svg(),
      ),
    );

    var suffixIcon = InkWell(
      onTap: widget.suffixOnPressed,
      child: Padding(
        padding: paddingOnlyEnd8,
        child: widget.icon,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label!,
          style: notoH5.copyWith(color: RenteeColors.additional2),
        ),
        15.heightBox,
        TextField(
          obscureText: passwordVisible,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            alignLabelWithHint: false,
            // fillColor: Colors.amber,
            fillColor: RenteeColors.additional6,
            border: inputBorderRoundedNone,
            contentPadding: paddingH20,
            labelStyle: notoH5.copyWith(color: RenteeColors.additional2),
            hintText: widget.placeholder,
            hintStyle: notoP2.copyWith(color: RenteeColors.additional4),
            suffixIcon: widget.isSecure ? passwordIcon : suffixIcon,
            suffixIconConstraints: boxConstraintsMxW24,
          ),
        ),
      ],
    );
  }

  passwordOnPress() {
    setState(
      () {
        passwordVisible = !passwordVisible;
      },
    );
  }
}
