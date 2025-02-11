import 'package:flutter_test/flutter_test.dart';
import 'package:moteis/domain/entities/suite_period.dart';

void main() {
  test('discountPercentage should return 0 if discount is null', () {
    const suitePeriod = SuitePeriod(
      time: '12:00',
      formattedTime: '12:00 PM',
      price: 100.0,
      totalPrice: 100.0,
      hasGift: false,
      discount: null,
    );

    expect(suitePeriod.discountPercentage, 0);
  });

  test(
      'discountPercentage should return correct percentage if discount is not null',
      () {
    const suitePeriod = SuitePeriod(
      time: '12:00',
      formattedTime: '12:00 PM',
      price: 100.0,
      totalPrice: 100.0,
      hasGift: false,
      discount: 20.0,
    );

    expect(suitePeriod.discountPercentage, 20);
  });

  test('discountPercentage should round to nearest integer', () {
    const suitePeriod = SuitePeriod(
      time: '12:00',
      formattedTime: '12:00 PM',
      price: 99.0,
      totalPrice: 99.0,
      hasGift: false,
      discount: 19.8,
    );

    expect(suitePeriod.discountPercentage, 20);
  });
}
