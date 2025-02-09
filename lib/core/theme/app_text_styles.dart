import 'package:flutter/widgets.dart';

abstract class AppTextStyles {
  static TextStyle get title => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get text => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get caption => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
}
