import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

BorderSide get inputBorder => const BorderSide(style: BorderStyle.none);

InputBorder inputBorderRoundedNone = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: circularRadius15,
);

BorderRadius borderRounded8 = BorderRadius.circular(8);
BorderRadius borderRounded4 = BorderRadius.circular(4);
BorderRadius borderRoundedTop30 =
    const BorderRadius.vertical(top: Radius.circular(30));
BorderRadius borderRoundedAll25 = const BorderRadius.all(Radius.circular(25));

Divider get onboardingDivider => const Divider(
      color: RenteeColors.secondary,
      thickness: 3.0,
      endIndent: 200.0,
      indent: 0,
    );
BoxDecoration get roundedContainerTop30 => BoxDecoration(
      color: RenteeColors.white,
      borderRadius: borderRoundedTop30,
    );
BoxDecoration get roundedContainerAll25 => BoxDecoration(
      color: RenteeColors.white,
      borderRadius: borderRoundedAll25,
    );
