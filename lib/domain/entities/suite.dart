import 'package:moteis/domain/entities/suite_category_item.dart';
import 'package:moteis/domain/entities/suite_period.dart';

class Suite {
  Suite({
    required this.name,
    required this.availableNumber,
    required this.showAvailableNumber,
    required this.images,
    required this.items,
    required this.categoryItems,
    required this.periods,
  });

  final String name;
  final int availableNumber;
  final bool showAvailableNumber;
  final List<String> images;
  final List<String> items;
  final List<SuiteCategoryItem> categoryItems;
  final List<SuitePeriod> periods;
}
