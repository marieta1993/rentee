import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

EdgeInsets get paddingH16V8 => const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    );
EdgeInsets get paddingH16V12 => const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    );
EdgeInsets get paddingV8H32 => const EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 32.0,
    );

EdgeInsets get paddingH16V24 => const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 24.0,
    );
EdgeInsets get paddingH14V18 => const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 14.0,
    );
EdgeInsets get paddingH48V24 => const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 48.0,
    );
EdgeInsets get paddingH32V20 => const EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 32.0,
    );
EdgeInsets get paddingH32V13 => const EdgeInsets.symmetric(
      vertical: 13.0,
      horizontal: 32.0,
    );
EdgeInsets get paddingH20V25 => const EdgeInsets.symmetric(
      vertical: 25.0,
      horizontal: 20.0,
    );
EdgeInsets get paddingV4 => const EdgeInsets.symmetric(vertical: 4);
EdgeInsets get paddingV10 => const EdgeInsets.symmetric(vertical: 10.0);
EdgeInsets get paddingV16 => const EdgeInsets.symmetric(vertical: 16);
EdgeInsets get paddingH14V6 =>
    const EdgeInsets.symmetric(horizontal: 14, vertical: 6.0);
EdgeInsets get paddingH15 => const EdgeInsets.symmetric(horizontal: 15);
EdgeInsets get paddingH20 => const EdgeInsets.symmetric(horizontal: 20);
EdgeInsets get paddingH32 => const EdgeInsets.symmetric(horizontal: 32);
EdgeInsets get paddingH48 => const EdgeInsets.symmetric(horizontal: 48.0);

EdgeInsets get paddingAll5 => const EdgeInsets.all(5.0);
EdgeInsets get paddingAll8 => const EdgeInsets.all(8.0);
EdgeInsets get paddingAll10 => const EdgeInsets.all(10.0);
EdgeInsets get paddingAll16 => const EdgeInsets.all(16.0);
EdgeInsets get paddingAll48 => const EdgeInsets.all(48.0);
EdgeInsets get paddingAll24 => const EdgeInsets.all(24.0);
EdgeInsets get paddingAll32 => const EdgeInsets.all(32.0);
EdgeInsets get padding0 => EdgeInsets.zero;

EdgeInsets get paddingT8 => const EdgeInsets.only(top: 8.0);
EdgeInsets get paddingB15 => const EdgeInsets.only(bottom: 15.0);
EdgeInsets get paddingL24 => const EdgeInsets.only(left: 24.0);
EdgeInsets get paddingL32B32 => const EdgeInsets.only(left: 32.0, bottom: 32.0);
EdgeInsets get paddingR20 => const EdgeInsets.only(right: 20.0);

EdgeInsetsDirectional get paddingOnlyEnd8 =>
    const EdgeInsetsDirectional.only(end: 8.0);

EdgeInsets get paddingAll4 => const EdgeInsets.all(4);

RoundedRectangleBorder get roundedBorder14 => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    );
RoundedRectangleBorder get roundedBorder15 => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );

BorderRadius get circularRadius35 => const BorderRadius.all(
      Radius.circular(35),
    );
BorderRadius get circularRadius20 => const BorderRadius.all(
      Radius.circular(20),
    );
BorderRadius get circularRadius15 => const BorderRadius.all(
      Radius.circular(15),
    );
BorderRadius get circularRadius12 => const BorderRadius.all(
      Radius.circular(12),
    );
BorderRadius get circularRadius10 => const BorderRadius.all(
      Radius.circular(10),
    );
BorderRadius get circularRadiusB25 => const BorderRadius.vertical(
      bottom: Radius.circular(25),
    );
BorderRadius get circularRadiusBL35BR35 => const BorderRadius.only(
    bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35));

BoxConstraints get boxConstraintsMxW24 => const BoxConstraints(
      maxWidth: 24,
    );
BoxConstraints get boxConstraintsMxW60 => const BoxConstraints(
      maxWidth: 60,
    );

extension DoubleSizedBox on num {
  Widget get heightBox => SizedBox(
        height: toDouble(),
      );
  Widget get widthBox => SizedBox(
        width: toDouble(),
      );
}
