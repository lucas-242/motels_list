import 'package:moteis/domain/entities/motel.dart';

abstract interface class MotelRepository {
  Future<List<Motel>> get();
}
