import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/presenter/home/components/suite_image.dart';
import 'package:moteis/presenter/home/components/suite_items.dart';
import 'package:moteis/presenter/home/components/suite_period_card.dart';
import 'package:moteis/presenter/home/pages/suite_images_page.dart';
import 'package:moteis/presenter/home/pages/suite_items_page.dart';

class SuiteList extends StatelessWidget {
  const SuiteList({super.key, required this.suites});

  final List<Suite> suites;

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   shrinkWrap: true,
    //   physics: BouncingScrollPhysics(),
    //   scrollDirection: Axis.horizontal,
    //   itemCount: suites.length,
    //   itemBuilder: (context, index) {
    //     final suite = suites[index];
    //     final isFirst = index == 0;
    //     final isLast = index == suites.length - 1;

    //     return Padding(
    //       key: ValueKey('suite-$index'),
    //       padding: EdgeInsets.only(
    //         left: isFirst ? AppInsets.xl : AppInsets.md,
    //         right: isLast ? AppInsets.xl : 0,
    //       ),
    //       child: Column(
    //         spacing: AppInsets.xxs,
    //         children: [
    //           GestureDetector(
    //             onTap: () => Scaffold.of(context).showBottomSheet(
    //               backgroundColor: AppColors.background,
    //               enableDrag: false,
    //               (context) => SuiteImagesPage(suite: suite),
    //             ),
    //             child: SuiteImage(suite: suite),
    //           ),
    //           GestureDetector(
    //             onTap: () => Scaffold.of(context).showBottomSheet(
    //               backgroundColor: AppColors.background,
    //               enableDrag: false,
    //               (context) => SuiteItemsPage(suite: suite),
    //             ),
    //             child: SuiteItems(
    //               mainItems: suite.categoryItems,
    //               otherItems: suite.items,
    //             ),
    //           ),
    //           for (final period in suite.periods) ...[
    //             SuitePeriodCard(period: period),
    //           ],
    //         ],
    //       ),
    //     );
    //   },
    // );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: suites.asMap().entries.map((entry) {
          final index = entry.key;
          final suite = suites[index];
          final isFirst = index == 0;
          final isLast = index == suites.length - 1;

          return Padding(
            key: ValueKey('suite-$index'),
            padding: EdgeInsets.only(
              left: isFirst ? AppInsets.xl : AppInsets.md,
              right: isLast ? AppInsets.xl : 0,
            ),
            child: Column(
              spacing: AppInsets.xxs,
              children: [
                GestureDetector(
                  onTap: () => Scaffold.of(context).showBottomSheet(
                    backgroundColor: AppColors.background,
                    enableDrag: false,
                    (context) => SuiteImagesPage(suite: suite),
                  ),
                  child: SuiteImage(suite: suite),
                ),
                GestureDetector(
                  onTap: () => Scaffold.of(context).showBottomSheet(
                    backgroundColor: AppColors.background,
                    enableDrag: false,
                    (context) => SuiteItemsPage(suite: suite),
                  ),
                  child: SuiteItems(
                    mainItems: suite.categoryItems,
                    otherItems: suite.items,
                  ),
                ),
                for (final period in suite.periods) ...[
                  SuitePeriodCard(period: period),
                ],
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
