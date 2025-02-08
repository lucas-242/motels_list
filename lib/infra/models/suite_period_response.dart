import 'package:json_annotation/json_annotation.dart';
import 'package:moteis/domain/entities/suite_period.dart';

part 'suite_period_response.g.dart';

@JsonSerializable(createToJson: false)
class SuitePeriodResponse {
  const SuitePeriodResponse({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory SuitePeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$SuitePeriodResponseFromJson(json);

  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final Discount? desconto;

  SuitePeriod toSuitePeriod() => SuitePeriod(
        formattedTime: tempoFormatado,
        time: tempo,
        price: valor,
        totalPrice: valorTotal,
        hasGift: temCortesia,
        discount: desconto?.desconto,
      );
}

@JsonSerializable(createToJson: false)
class Discount {
  const Discount(this.desconto);

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  final double desconto;
}
