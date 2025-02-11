import 'package:flutter_test/flutter_test.dart';
import 'package:moteis/domain/entities/suite.dart';

void main() {
  test('itemsNormalized should return a comma-separated string of items', () {
    final suite = Suite(
      name: 'Deluxe Suite',
      availableNumber: 5,
      showAvailableNumber: true,
      images: [],
      items: ['WiFi', 'TV', 'Mini Bar'],
      categoryItems: [],
      periods: [],
    );

    expect(suite.itemsNormalized, 'WiFi, TV, Mini Bar');
  });
}
