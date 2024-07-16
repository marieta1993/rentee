import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

const packageName = 'uikit';

TextStyle get elevatedButtonTextStyles => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 18.0,
      height: 24.0 / 18.0,
      fontWeight: FontWeight.bold,
      package: packageName,
    );

//Splash screen text style

TextStyle get splashH20 => const TextStyle(
    fontFamily: FontFamily.notoSans,
    fontSize: 20.0,
    height: 24.0 / 20.0,
    color: RenteeColors.white,
    letterSpacing: 3.0,
    fontWeight: FontWeight.w600);

TextStyle get splashH => const TextStyle(
    fontFamily: FontFamily.notoSans,
    fontSize: 36.0,
    height: 32.0 / 36.0,
    color: RenteeColors.white,
    letterSpacing: 3.0,
    fontWeight: FontWeight.w600);

//Onboarding screen elements style

TextStyle get onboardingH => ptSerifH1.copyWith(color: RenteeColors.primary);

//Login screen elements style
TextStyle get authH => const TextStyle(
    fontFamily: FontFamily.notoSans,
    fontSize: 36.0,
    height: 32.0 / 36.0,
    color: RenteeColors.white,
    letterSpacing: 3.0,
    fontWeight: FontWeight.w600);
//Noto headings
TextStyle get notoH1 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 22.0,
      height: 32.0 / 22.0,
      fontWeight: FontWeight.w600,
      package: packageName,
    );
TextStyle get notoH2 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 18.0,
      height: 32.0 / 18.0,
      fontWeight: FontWeight.w600,
      package: packageName,
    );
TextStyle get notoH3 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 16.0,
      height: 24.0 / 16.0,
      fontWeight: FontWeight.w600,
      package: packageName,
    );
TextStyle get notoH4 => const TextStyle(
    fontFamily: FontFamily.notoSans,
    fontSize: 14.0,
    height: 18.0 / 14.0,
    fontWeight: FontWeight.w600,
    package: packageName);
TextStyle get notoH5 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 12.0,
      height: 16.0 / 12.0,
      fontWeight: FontWeight.w600,
      package: packageName,
    );
TextStyle get notoText => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 16.0,
      height: 24.0 / 16.0,
      fontWeight: FontWeight.w700,
      package: packageName,
    );

//Noto paragraphs

TextStyle get notoP1 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 16.0,
      height: 24.0 / 16.0,
      fontWeight: FontWeight.w400,
      package: packageName,
    );
TextStyle get notoP2 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 14.0,
      height: 24.0 / 14.0,
      fontWeight: FontWeight.w400,
      package: packageName,
    );
TextStyle get notoP3 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 12.0,
      height: 16.0 / 12.0,
      fontWeight: FontWeight.w400,
      package: packageName,
    );
TextStyle get notoP4 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 11.0,
      height: 14.0 / 11.0,
      fontWeight: FontWeight.w500,
      package: packageName,
    );
TextStyle get notoP5 => const TextStyle(
      fontFamily: FontFamily.notoSans,
      fontSize: 8.0,
      height: 12.0 / 8.0,
      fontWeight: FontWeight.w500,
      package: packageName,
    );

//PT Serif headings
TextStyle get ptSerifH1 => const TextStyle(
      fontFamily: FontFamily.pTSerif,
      fontSize: 28.0,
      height: 32.0 / 28.0,
      fontWeight: FontWeight.w700,
      package: packageName,
    );
TextStyle get ptSerifH2 => const TextStyle(
      fontFamily: FontFamily.pTSerif,
      fontSize: 24.0,
      height: 32.0 / 24.0,
      fontWeight: FontWeight.w700,
      package: packageName,
    );
TextStyle get ptSerifH3 => const TextStyle(
      fontFamily: FontFamily.pTSerif,
      fontSize: 22.0,
      height: 32.0 / 22.0,
      fontWeight: FontWeight.w700,
      package: packageName,
    );
TextStyle get ptSerifH4 => const TextStyle(
      fontFamily: FontFamily.pTSerif,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      package: packageName,
    );
TextStyle get ptSerifH5 => const TextStyle(
      fontFamily: FontFamily.pTSerif,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      package: packageName,
    );

//PT Serif paragraphs
TextStyle get ptSerifP1 => const TextStyle(
      fontFamily: FontFamily.pTSerif,
      fontSize: 16.0,
      height: 24.0 / 16.0,
      fontWeight: FontWeight.w400,
      package: packageName,
    );
