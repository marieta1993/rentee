import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'rentee_colors.dart';
import 'rentee_text_styles.dart';

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
        foregroundColor: MaterialStateProperty.all(RenteeColors.white),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(RenteeColors.primary),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return elevatedButtonTextStyles.copyWith(fontSize: 24.0);
          }
          return elevatedButtonTextStyles.copyWith(fontSize: 18.0);
        }),
      ),
    );
