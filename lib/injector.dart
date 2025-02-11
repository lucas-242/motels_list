import 'package:get_it/get_it.dart';
import 'package:moteis/core/network/http/http_network_service.dart';
import 'package:moteis/core/network/network_service.dart';
import 'package:moteis/domain/repositories/motel_repository.dart';
import 'package:moteis/domain/use_cases/get_motels_use_case.dart';
import 'package:moteis/infra/repositories/motel_repository_impl.dart';
import 'package:moteis/presenter/home/cubits/home_cubit.dart';

abstract class Injector {
  static final _i = GetIt.instance;

  static T get<T extends Object>({String? instanceName}) =>
      _i.get<T>(instanceName: instanceName);

  static void init() {
    _i.registerSingleton<NetworkService>(HttpNetworkService());

    _i.registerFactory<MotelRepository>(
      () => MotelRepositoryImpl(_i.get<NetworkService>()),
    );

    _i.registerFactory<GetMotelsUseCase>(
      () => GetMotelsUseCaseImpl(_i.get<MotelRepository>()),
    );

    _i.registerFactory<HomeCubit>(
      () => HomeCubit(_i.get<GetMotelsUseCase>()),
    );
  }
}
