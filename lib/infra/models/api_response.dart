import 'package:json_annotation/json_annotation.dart';
import 'package:moteis/infra/models/motel_response.dart';

part 'api_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiResponse {
  const ApiResponse(this.sucesso, this.data);

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  final bool sucesso;
  final Data data;
}

@JsonSerializable(createToJson: false)
class Data {
  const Data({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final int raio;
  final int maxPaginas;
  final List<MotelResponse> moteis;
}
