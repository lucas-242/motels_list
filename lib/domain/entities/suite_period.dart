class SuitePeriod {
  const SuitePeriod({
    required this.time,
    required this.formattedTime,
    required this.price,
    required this.totalPrice,
    required this.hasGift,
    required this.discount,
  });

  final String time;
  final String formattedTime;
  final double price;
  final double totalPrice;
  final bool hasGift;
  final double? discount;
}
