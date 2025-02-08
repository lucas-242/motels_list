import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moteis/core/errors/errors.dart';
import 'package:moteis/domain/entities/motel.dart';
import 'package:moteis/domain/repositories/motel_repository.dart';
import 'package:moteis/domain/use_cases/get_motels_use_case.dart';

import '../../mock/motels_mock.dart';
import 'get_motels_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MotelRepository>()])
void main() {
  late final MotelRepository motelRepository;
  late final GetMotelsUseCase getMotelsUseCase;

  setUpAll(() {
    motelRepository = MockMotelRepository();
    getMotelsUseCase = GetMotelsUseCaseImpl(motelRepository);
  });

  setUp(() {
    reset(motelRepository);
  });

  test('should return a list of motels', () async {
    when(motelRepository.get()).thenAnswer(
      (_) async => Future.value(MotelsMock.motels),
    );

    final response = await getMotelsUseCase();

    expect(response, isNotEmpty);
    expect(response, isA<List<Motel>>());
    verify(motelRepository.get()).called(1);
  });

  test('should return a empty list of motels', () async {
    when(motelRepository.get()).thenAnswer(
      (_) async => Future.value(List<Motel>.empty()),
    );

    final response = await getMotelsUseCase();

    expect(response, isEmpty);
    expect(response, isA<List<Motel>>());
    verify(motelRepository.get()).called(1);
  });

  test('should throw ExternalError when there is an error in the use case',
      () async {
    when(motelRepository.get()).thenThrow((_) => Exception('Test'));

    await expectLater(getMotelsUseCase(), throwsA(isA<ExternalError>()));
    verify(motelRepository.get()).called(1);
  });
}
