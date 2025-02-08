import 'package:moteis/domain/entities/motel.dart';
import 'package:moteis/infra/models/suite_response.dart';

class MotelResponse {
  MotelResponse({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteResponse> suites;
  final int qtdAvaliacoes;
  final double media;

  Motel toMotel() => Motel(
        name: fantasia,
        logo: logo,
        address: bairro,
        distance: distancia,
        favoriteNumber: qtdFavoritos,
        suites: suites.map((e) => e.toSuite()).toList(),
        feedbackNumber: qtdAvaliacoes,
        rating: media,
      );
}
