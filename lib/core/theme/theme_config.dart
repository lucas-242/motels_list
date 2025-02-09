import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';

abstract class ThemeConfig {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.background,
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyles.text,
          bodyMedium: AppTextStyles.text,
          bodySmall: AppTextStyles.caption,
        ),
      );
}
