import 'package:flutter/material.dart';
import 'package:moteis/core/components/loading_skeleton.dart';
import 'package:moteis/core/theme/theme.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppInsets.lg,
        horizontal: AppInsets.lg,
      ),
      child: Column(
        spacing: AppInsets.xs,
        children: [
          Row(
            spacing: AppInsets.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: LoadingSkeleton(
                  height: context.height * .07,
                  width: context.height * .07,
                ),
              ),
              Expanded(child: LoadingSkeleton(height: context.height * .12)),
            ],
          ),
          LoadingSkeleton(
            height: context.height * .3,
            width: context.width,
          ),
          ...List.generate(
            4,
            (index) => LoadingSkeleton(
              height: context.height * .09,
              width: context.width,
            ),
          ),
        ],
      ),
    );
  }
}
