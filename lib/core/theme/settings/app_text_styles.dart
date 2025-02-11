import 'package:flutter/widgets.dart';

abstract class AppTextStyles {
  static TextStyle get headline => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get title => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get subtitle => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get bodyBig => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get body => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get caption => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
}
