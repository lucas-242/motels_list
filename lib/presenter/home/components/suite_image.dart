import 'package:flutter/material.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/presenter/home/components/suite_card.dart';

class SuiteImage extends StatelessWidget {
  const SuiteImage({super.key, required this.suite});
  final Suite suite;

  @override
  Widget build(BuildContext context) {
    return SuiteCard(
      child: Column(
        children: [
          ImageSelector(url: suite.images.first),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppInsets.md,
              vertical: AppInsets.xl,
            ),
            child: Center(
              child: Text(
                suite.name,
                style: AppTextStyles.title,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
