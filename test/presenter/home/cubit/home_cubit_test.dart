import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moteis/core/errors/errors.dart';
import 'package:moteis/domain/use_cases/get_motels_use_case.dart';
import 'package:moteis/presenter/home/cubit/home_cubit.dart';

import '../../../mock/motels_mock.dart';
import 'home_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetMotelsUseCase>()])
void main() {
  late final GetMotelsUseCase getMotelsUseCase;

  setUpAll(() {
    getMotelsUseCase = MockGetMotelsUseCase();
  });

  test('initial state is InitialState', () {
    final homeCubit = HomeCubit(getMotelsUseCase);
    expect(homeCubit.state, isA<HomeLoading>());
    homeCubit.close();
  });

  blocTest<HomeCubit, HomeState>(
    'emits [HomeLoading, HomeInitial] when getMotels is called',
    build: () => HomeCubit(getMotelsUseCase),
    setUp: () {
      when(getMotelsUseCase()).thenAnswer((_) async => MotelsMock.motels);
    },
    act: (cubit) => cubit.getMotels(),
    expect: () => [
      isA<HomeLoading>().having((state) => state.motels, 'motels', isEmpty),
      isA<HomeInitial>()
          .having((state) => state.motels, 'motels', MotelsMock.motels),
    ],
    verify: (bloc) => verify(getMotelsUseCase()).called(1),
  );

  blocTest<HomeCubit, HomeState>(
    'emits [HomeLoading, HomeError] when getMotels triggers an Exception',
    build: () => HomeCubit(getMotelsUseCase),
    setUp: () {
      when(getMotelsUseCase()).thenThrow((_) async => Exception());
    },
    act: (cubit) => cubit.getMotels(),
    expect: () => [
      isA<HomeLoading>().having((state) => state.motels, 'motels', isEmpty),
      isA<HomeError>().having((state) => state.motels, 'motels', isEmpty),
    ],
    verify: (bloc) => verify(getMotelsUseCase()).called(1),
  );

  blocTest<HomeCubit, HomeState>(
    'emits [HomeLoading, HomeError] when getMotels triggers an AppError',
    build: () => HomeCubit(getMotelsUseCase),
    setUp: () {
      when(getMotelsUseCase()).thenThrow(ExternalError('error'));
    },
    act: (cubit) => cubit.getMotels(),
    expect: () => [
      isA<HomeLoading>().having((state) => state.motels, 'motels', isEmpty),
      isA<HomeError>().having((state) => state.motels, 'motels', isEmpty),
    ],
    verify: (bloc) => verify(getMotelsUseCase()).called(1),
  );
}
