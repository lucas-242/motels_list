import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/domain/entities/suite_category_item.dart';
import 'package:moteis/infra/models/suite_period_response.dart';

class SuiteResponse {
  SuiteResponse({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

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

class SuiteItemResponse {
  SuiteItemResponse(this.nome);

  final String nome;
}

class CategoryItemResponse {
  CategoryItemResponse({required this.nome, required this.icone});

  final String nome;
  final String icone;

  SuiteCategoryItem toSuiteCategoryItem() =>
      SuiteCategoryItem(name: nome, icon: icone);
}
