import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_dimensions.dart';

import 'rentee_colors.dart';
import 'rentee_text_styles.dart';

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(paddingH16V8),
        foregroundColor: MaterialStateProperty.all(RenteeColors.white),
        shape: MaterialStateProperty.all(roundedBorder14),
        backgroundColor: MaterialStateProperty.all(RenteeColors.primary),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return notoH4;
          }
          return notoH3;
        }),
      ),
    );

ButtonStyle get secondaryButton =>
    ElevatedButton.styleFrom(backgroundColor: RenteeColors.secondary);

ButtonStyle get grayButton => ElevatedButton.styleFrom(
      backgroundColor: RenteeColors.gray,
      foregroundColor: RenteeColors.buttonTextColor,
    );

ButtonStyle get tertiaryButton => ElevatedButton.styleFrom(
      backgroundColor: RenteeColors.tertiary,
      foregroundColor: RenteeColors.primary,
    );

IconButtonThemeData get iconButtonThemeData => IconButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(color: RenteeColors.primary),
        ),
        backgroundColor: MaterialStateProperty.all(RenteeColors.white),
        shape: MaterialStateProperty.all(roundedBorder14),
        foregroundColor: MaterialStateProperty.all(RenteeColors.primary),
      ),
    );

ButtonStyle iconFilledButton = IconButton.styleFrom(
  backgroundColor: RenteeColors.secondary,
  foregroundColor: RenteeColors.white,
  side: BorderSide.none,
);
