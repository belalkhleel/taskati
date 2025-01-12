import 'package:flutter/cupertino.dart';
import 'package:taskati/core/utils/colors.dart';

class CustomTextStyle extends TextStyle{
  static TextStyle titleTextStyle(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? AppColor.primary,
        fontSize: fontSize ?? 30,
        fontWeight: fontWeight ?? FontWeight.bold);
  }

  static TextStyle bodyTextStyle(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? AppColor.primary,
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.bold);
  }



  static TextStyle smallTextStyle(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? AppColor.tertiary,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.bold);
  }
  }






