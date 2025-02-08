import 'package:moteis/infra/models/motel_response.dart';

class ApiResponse {
  ApiResponse(this.sucesso, this.data);

  final bool sucesso;
  final Data? data;
}

class Data {
  Data({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
  });

  final int? pagina;
  final int? qtdPorPagina;
  final int? totalSuites;
  final int? totalMoteis;
  final int? raio;
  final int? maxPaginas;
  List<MotelResponse>? moteis;
}
