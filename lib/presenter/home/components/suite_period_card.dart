import 'package:flutter/material.dart';
import 'package:moteis/core/components/discount_badge.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/core/utils/formatter_utils.dart';
import 'package:moteis/domain/entities/suite_period.dart';
import 'package:moteis/presenter/home/components/suite_card.dart';

class SuitePeriodCard extends StatelessWidget {
  const SuitePeriodCard({super.key, required this.period});
  final SuitePeriod period;

  @override
  Widget build(BuildContext context) {
    return SuiteCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppInsets.xxs),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: AppInsets.xs,
                  children: [
                    Text(period.formattedTime, style: AppTextStyles.title),
                    if (period.discount != null)
                      DiscountBadge(
                        discountPercentage: period.discountPercentage,
                      ),
                  ],
                ),
                Row(
                  spacing: AppInsets.md,
                  children: [
                    Text(
                      FormatterUtils.currency(period.price),
                      style: AppTextStyles.title.copyWith(
                        decoration: period.discount != null
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: AppColors.grey,
                        color: period.discount != null
                            ? AppColors.grey
                            : AppColors.black,
                      ),
                    ),
                    if (period.discount != null)
                      Text(
                        FormatterUtils.currency(period.totalPrice),
                        style: AppTextStyles.title.copyWith(
                          decoration: TextDecoration.none,
                          color: AppColors.black,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.grey,
              size: AppInsets.xxl,
            ),
          ],
        ),
      ),
    );
  }
}
