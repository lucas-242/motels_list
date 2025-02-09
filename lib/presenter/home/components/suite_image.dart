import 'package:flutter/material.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';

class SuiteImage extends StatelessWidget {
  const SuiteImage({super.key, required this.suite});
  final Suite suite;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: context.width * .9,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(AppInsets.xs),
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
          ),
        ),
      ),
    );
  }
}
