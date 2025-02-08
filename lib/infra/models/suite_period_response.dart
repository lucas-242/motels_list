import 'package:moteis/domain/entities/suite_period.dart';

class SuitePeriodResponse {
  SuitePeriodResponse({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    required this.desconto,
  });

  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final Discount desconto;

  SuitePeriod toSuitePeriod() => SuitePeriod(
        formattedTime: tempoFormatado,
        time: tempo,
        price: valor,
        totalPrice: valorTotal,
        hasGift: temCortesia,
        discount: desconto.desconto,
      );
}

class Discount {
  Discount(this.desconto);

  final double desconto;
}
