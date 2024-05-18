import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

BorderSide get inputBorder => const BorderSide(style: BorderStyle.none);

InputBorder inputBorderRoundedNone = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: circularRadius15,
);

BorderRadius borderRounded8 = BorderRadius.circular(8);
BorderRadius borderRounded4 = BorderRadius.circular(4);
BorderRadius borderRounded5 = BorderRadius.circular(5);