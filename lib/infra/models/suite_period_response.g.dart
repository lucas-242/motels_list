// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_period_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuitePeriodResponse _$SuitePeriodResponseFromJson(Map<String, dynamic> json) =>
    SuitePeriodResponse(
      tempoFormatado: json['tempoFormatado'] as String,
      tempo: json['tempo'] as String,
      valor: (json['valor'] as num).toDouble(),
      valorTotal: (json['valorTotal'] as num).toDouble(),
      temCortesia: json['temCortesia'] as bool,
      desconto: json['desconto'] == null
          ? null
          : Discount.fromJson(json['desconto'] as Map<String, dynamic>),
    );

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      (json['desconto'] as num).toDouble(),
    );
