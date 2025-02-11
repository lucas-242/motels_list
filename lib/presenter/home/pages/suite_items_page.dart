import 'package:flutter/material.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/components/text_divider.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';

class SuiteItemsPage extends StatelessWidget {
  const SuiteItemsPage({super.key, required this.suite});

  final Suite suite;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppInsets.xxxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppInsets.xl,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_drop_down, size: 40),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppInsets.xl,
                    children: [
                      Text(
                        suite.name,
                        style: AppTextStyles.headline,
                        textAlign: TextAlign.center,
                      ),
                      TextDivider(text: 'principais itens'),
                      Wrap(
                        spacing: AppInsets.xl,
                        children: suite.categoryItems
                            .map(
                              (item) => Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: AppInsets.xxxs,
                                children: [
                                  ImageSelector(url: item.icon, width: 40),
                                  Text(item.name, style: AppTextStyles.bodyBig),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      TextDivider(text: 'tem também'),
                      Text(suite.itemsNormalized, style: AppTextStyles.bodyBig),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
