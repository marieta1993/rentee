import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class RenteeInputField extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final Widget? icon;
  final bool isSecure;
  final VoidCallback? suffixOnPressed;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const RenteeInputField(
      {this.label,
      this.icon,
      this.placeholder = 'Your placeholder',
      this.suffixOnPressed,
      super.key,
      this.controller,
      this.validator,
      this.keyboardType})
      : isSecure = false;

  const RenteeInputField.password({
    this.label,
    this.icon,
    this.placeholder = 'Password',
    this.suffixOnPressed,
    super.key,
    this.controller,
    this.validator,
    this.keyboardType,
  }) : isSecure = true;

  @override
  State<RenteeInputField> createState() => _RenteeInputFieldState();
}

class _RenteeInputFieldState extends State<RenteeInputField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    var passwordIcon = InkWell(
      onTap: passwordOnPress,
      child: Padding(
        padding: paddingOnlyEnd8,
        child: !passwordVisible
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

    var field = TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isSecure && passwordVisible,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        alignLabelWithHint: false,
        fillColor: RenteeColors.additional6,
        border: inputBorderRoundedNone,
        contentPadding: paddingH20,
        labelStyle: notoH5.copyWith(color: RenteeColors.additional2),
        hintText: widget.placeholder,
        hintStyle: notoP2.copyWith(color: RenteeColors.additional4),
        suffixIcon: widget.isSecure ? passwordIcon : suffixIcon,
        suffixIconConstraints: boxConstraintsMxW24,
      ),
    );
    return widget.label != null && widget.label!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label!,
                style: notoH5.copyWith(color: RenteeColors.additional2),
              ),
              15.heightBox,
              field
            ],
          )
        : field;
  }

  passwordOnPress() {
    setState(
      () {
        passwordVisible = !passwordVisible;
      },
    );
  }
}
