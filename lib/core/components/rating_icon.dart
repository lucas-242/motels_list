import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';

class RatingIcon extends StatelessWidget {
  const RatingIcon({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4, right: 6, top: 2, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.yellow),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: AppColors.yellow, size: 16),
          SizedBox(width: 4),
          Text(rating.toString(), style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
