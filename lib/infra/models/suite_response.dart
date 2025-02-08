import 'package:json_annotation/json_annotation.dart';
import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/domain/entities/suite_category_item.dart';
import 'package:moteis/infra/models/suite_period_response.dart';

part 'suite_response.g.dart';

@JsonSerializable(createToJson: false)
class SuiteResponse {
  const SuiteResponse({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory SuiteResponse.fromJson(Map<String, dynamic> json) =>
      _$SuiteResponseFromJson(json);

  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<SuiteItemResponse> itens;
  final List<CategoryItemResponse> categoriaItens;
  final List<SuitePeriodResponse> periodos;

  Suite toSuite() => Suite(
        name: nome,
        availableNumber: qtd,
        showAvailableNumber: exibirQtdDisponiveis,
        images: fotos,
        items: itens.map((e) => e.nome).toList(),
        categoryItems:
            categoriaItens.map((e) => e.toSuiteCategoryItem()).toList(),
        periods: periodos.map((e) => e.toSuitePeriod()).toList(),
      );
}

@JsonSerializable(createToJson: false)
class SuiteItemResponse {
  const SuiteItemResponse(this.nome);

  factory SuiteItemResponse.fromJson(Map<String, dynamic> json) =>
      _$SuiteItemResponseFromJson(json);

  final String nome;
}

@JsonSerializable(createToJson: false)
class CategoryItemResponse {
  const CategoryItemResponse({required this.nome, required this.icone});

  factory CategoryItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemResponseFromJson(json);

  final String nome;
  final String icone;

  SuiteCategoryItem toSuiteCategoryItem() =>
      SuiteCategoryItem(name: nome, icon: icone);
}
