import 'package:flutter/material.dart';
import 'package:moteis/core/theme/settings/app_insets.dart';
import 'package:moteis/core/theme/settings/app_spacings.dart';
import 'package:moteis/core/theme/theme.dart';

class RatingIcon extends StatelessWidget {
  const RatingIcon({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppInsets.xxs,
        right: AppInsets.xs,
        top: AppInsets.xxxs,
        bottom: AppInsets.xxxs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppInsets.xs),
        border: Border.all(color: AppColors.yellow),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: AppColors.yellow, size: 16),
          AppSpacings.horizontalXxs,
          Text(rating.toString(), style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
