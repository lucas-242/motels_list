import 'package:moteis/core/errors/errors.dart';
import 'package:moteis/domain/entities/motel.dart';
import 'package:moteis/domain/repositories/motel_repository.dart';

abstract interface class GetMotelsUseCase {
  Future<List<Motel>> call();
}

class GetMotelsUseCaseImpl implements GetMotelsUseCase {
  GetMotelsUseCaseImpl(this._motelRepository);

  final MotelRepository _motelRepository;

  @override
  Future<List<Motel>> call() async {
    try {
      return _motelRepository.get();
    } catch (error, trace) {
      throw ExternalError('Erro ao buscar os motéis', trace: trace);
    }
  }
}
