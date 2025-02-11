import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';

abstract class ThemeConfig {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.background,
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyles.body,
          bodyMedium: AppTextStyles.body,
          bodySmall: AppTextStyles.caption,
        ),
        cardTheme: _cardTheme(),
        dividerTheme: _dividerTheme(),
      );

  static CardTheme _cardTheme() => CardTheme(
        elevation: 0,
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppInsets.sm),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      );

  static DividerThemeData _dividerTheme() => DividerThemeData(
        color: AppColors.divider,
        space: AppInsets.sm,
        thickness: 1,
      );
}
