import 'package:get_it/get_it.dart';
import 'package:moteis/core/network/http/http_network_service.dart';
import 'package:moteis/core/network/network_service.dart';
import 'package:moteis/domain/repositories/motel_repository.dart';
import 'package:moteis/infra/repositories/motel_repository_impl.dart';

abstract class Injector {
  static final _i = GetIt.instance;

  void init() {
    _i.registerSingleton<NetworkService>(HttpNetworkService());
    _i.registerFactory<MotelRepository>(() => MotelRepositoryImpl(_i.get()));
  }
}
