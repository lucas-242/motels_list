import 'package:moteis/core/errors/errors.dart';
import 'package:moteis/core/network/end_points.dart';
import 'package:moteis/core/network/network_response.dart';
import 'package:moteis/core/network/network_service.dart';
import 'package:moteis/domain/entities/motel.dart';
import 'package:moteis/domain/repositories/motel_repository.dart';
import 'package:moteis/infra/models/api_response.dart';

final class MotelRepositoryImpl implements MotelRepository {
  MotelRepositoryImpl(this._networkService);

  final NetworkService _networkService;

  @override
  Future<List<Motel>> get() async {
    try {
      final response = await _networkService.get(EndPoints.getMotels).handle();

      final apiResponse = ApiResponse.fromJson(response.json);

      if (apiResponse.sucesso == false) {
        throw ExternalError('Erro ao buscar motéis');
      }

      return apiResponse.data.moteis.map((m) => m.toMotel()).toList();
    } catch (error, trace) {
      throw ExternalError('Erro ao buscar motéis', trace: trace);
    }
  }
}
