import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';

class DiscountBadge extends StatelessWidget {
  const DiscountBadge({super.key, required this.discountPercentage});
  final int discountPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppInsets.xxxs,
        horizontal: AppInsets.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppInsets.xxxl),
        border: Border.all(color: AppColors.green),
      ),
      child: Text(
        '$discountPercentage% off',
        style: AppTextStyles.caption.copyWith(
          decoration: TextDecoration.none,
          color: AppColors.green,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
