// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuiteResponse _$SuiteResponseFromJson(Map<String, dynamic> json) =>
    SuiteResponse(
      nome: json['nome'] as String,
      qtd: (json['qtd'] as num).toInt(),
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] as bool,
      fotos: (json['fotos'] as List<dynamic>).map((e) => e as String).toList(),
      itens: (json['itens'] as List<dynamic>)
          .map((e) => SuiteItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriaItens: (json['categoriaItens'] as List<dynamic>)
          .map((e) => CategoryItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      periodos: (json['periodos'] as List<dynamic>)
          .map((e) => SuitePeriodResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SuiteItemResponse _$SuiteItemResponseFromJson(Map<String, dynamic> json) =>
    SuiteItemResponse(
      json['nome'] as String,
    );

CategoryItemResponse _$CategoryItemResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryItemResponse(
      nome: json['nome'] as String,
      icone: json['icone'] as String,
    );
