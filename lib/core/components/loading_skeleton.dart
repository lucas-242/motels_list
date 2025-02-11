import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmer,
      highlightColor: AppColors.grey,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(AppInsets.xs),
        decoration: BoxDecoration(
          color: AppColors.shimmer,
          borderRadius: const BorderRadius.all(Radius.circular(AppInsets.md)),
        ),
      ),
    );
  }
}
