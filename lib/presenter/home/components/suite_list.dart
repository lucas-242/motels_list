import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/presenter/home/components/suite_image.dart';

class SuiteList extends StatelessWidget {
  const SuiteList({super.key, required this.suites});

  final List<Suite> suites;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suites.length,
        itemBuilder: (context, index) {
          final suite = suites[index];
          final isFirst = index == 0;
          final isLast = index == suites.length - 1;

          return Padding(
            padding: EdgeInsets.only(
              left: isFirst ? AppInsets.xl : AppInsets.md,
              right: isLast ? AppInsets.xl : 0,
            ),
            child: Column(
              children: [
                SuiteImage(suite: suite),
              ],
            ),
          );
        },
      ),
    );
  }
}
