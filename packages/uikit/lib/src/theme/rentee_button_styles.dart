import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_dimensions.dart';
import 'package:uikit/src/widgets/buttons/rentee_elevated_button.dart';

import 'rentee_colors.dart';
import 'rentee_text_styles.dart';

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(paddingH16V24),
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

ButtonStyle get secondaryButton => ButtonStyle(
    backgroundColor: MaterialStateProperty.all(RenteeColors.secondary));
ButtonStyle get grayButton => ButtonStyle(
    backgroundColor: MaterialStateProperty.all(RenteeColors.gray),
    foregroundColor: MaterialStateProperty.all((RenteeColors.buttonTextColor)));
ButtonStyle get tertiaryButton => ButtonStyle(
    backgroundColor: MaterialStateProperty.all(RenteeColors.tertiary),
    foregroundColor: MaterialStateProperty.all((RenteeColors.primary)));
ButtonStyle get iconButton => ButtonStyle(
    side: MaterialStateProperty.all(
        const BorderSide(color: RenteeColors.primary)),
    backgroundColor: MaterialStateProperty.all(RenteeColors.white),
    foregroundColor: MaterialStateProperty.all((RenteeColors.primary)),
    overlayColor: MaterialStateProperty.all((RenteeColors.primary)));
