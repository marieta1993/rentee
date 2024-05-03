import 'package:flutter/material.dart';

EdgeInsets get paddingH16V8 =>
    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

EdgeInsets get paddingH16V24 =>
    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0);
EdgeInsets get paddingH20 => const EdgeInsets.symmetric(horizontal: 20);

EdgeInsetsDirectional get paddingOnlyEnd8 =>
    const EdgeInsetsDirectional.only(end: 8.0);

RoundedRectangleBorder get roundedBorder14 => const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(14)));
RoundedRectangleBorder get roundedBorder15 => const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)));

BorderRadius get circularRadius15 =>
    const BorderRadius.all(Radius.circular(15));

BoxConstraints get boxConstraintsMxW24 => const BoxConstraints(maxWidth: 24);

extension DoubleSizedBox on num {
  Widget get heightBox => SizedBox(
        height: toDouble(),
      );
  Widget get widthBox => SizedBox(
        width: toDouble(),
      );
}
