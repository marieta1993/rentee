import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

BorderSide get inputBorder => const BorderSide(style: BorderStyle.none);

InputBorder inputBorderRoundedNone = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: circularRadius15,
);
