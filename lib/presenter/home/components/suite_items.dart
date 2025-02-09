import 'package:flutter/material.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite_category_item.dart';
import 'package:moteis/presenter/home/components/suite_card.dart';

class SuiteItems extends StatelessWidget {
  const SuiteItems({
    super.key,
    required this.mainItems,
    required this.otherItems,
  });
  final List<SuiteCategoryItem> mainItems;
  final List<String> otherItems;

  @override
  Widget build(BuildContext context) {
    return SuiteCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppInsets.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppInsets.sm,
          children: [
            for (final item in mainItems.take(5))
              Container(
                width: context.width * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(AppInsets.xxs),
                ),
                child: ImageSelector(url: item.icon),
              ),
            if (otherItems.isNotEmpty)
              Row(
                spacing: AppInsets.xxs,
                children: [
                  Text(
                    'ver \n todos',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: AppColors.grey),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
