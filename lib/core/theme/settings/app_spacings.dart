import 'package:flutter/widgets.dart';
import 'package:moteis/core/theme/settings/app_insets.dart';

abstract class AppSpacings {
  // Vertical space
  ///2.0
  static const verticalXxxs = SizedBox(height: AppInsets.xxxs);

  ///4.0
  static const verticalXxs = SizedBox(height: AppInsets.xxs);

  ///8.0
  static const verticalXs = SizedBox(height: AppInsets.xs);

  ///10.0
  static const verticalSm = SizedBox(height: AppInsets.sm);

  ///12.0
  static const verticalMd = SizedBox(height: AppInsets.md);

  ///16.0
  static const verticalLg = SizedBox(height: AppInsets.lg);

  ///20.0
  static const verticalXl = SizedBox(height: AppInsets.xl);

  ///32.0
  static const verticalXxl = SizedBox(height: AppInsets.xxl);

  ///48.0
  static const verticalXxxl = SizedBox(height: AppInsets.xxxl);

  // Horizontal space

  ///2.0
  static const horizontalXxxs = SizedBox(width: AppInsets.xxxs);

  ///4.0
  static const horizontalXxs = SizedBox(width: AppInsets.xxs);

  ///8.0
  static const horizontalXs = SizedBox(width: AppInsets.xs);

  ///10.0
  static const horizontalSm = SizedBox(width: AppInsets.sm);

  ///12.0
  static const horizontalMd = SizedBox(width: AppInsets.md);

  ///16.0
  static const horizontalLg = SizedBox(width: AppInsets.lg);

  ///20.0
  static const horizontalXl = SizedBox(width: AppInsets.xl);

  ///32.0
  static const horizontalXxl = SizedBox(width: AppInsets.xxl);

  ///48.0
  static const horizontalXxxl = SizedBox(width: AppInsets.xxxl);
}
