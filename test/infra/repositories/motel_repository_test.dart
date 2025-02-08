import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moteis/core/errors/errors.dart';
import 'package:moteis/core/network/end_points.dart';
import 'package:moteis/core/network/network_service.dart';
import 'package:moteis/domain/entities/motel.dart';
import 'package:moteis/domain/repositories/motel_repository.dart';
import 'package:moteis/infra/repositories/motel_repository_impl.dart';

import '../../mock/motels_mock.dart';
import '../../mock/network_response_mock.dart';
import 'motel_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkService>()])
void main() {
  late final NetworkService networkService;
  late final MotelRepository motelRepository;

  setUpAll(() {
    networkService = MockNetworkService();
    motelRepository = MotelRepositoryImpl(networkService);
  });

  test('should return a list of motels', () async {
    when(networkService.get(EndPoints.getMotels)).thenAnswer(
      (_) async => Future.value(
        NetworkResponseMock.getSuccess(MotelsMock.motelsResponse),
      ),
    );

    final response = await motelRepository.get();

    expect(response, isNotEmpty);
    expect(response, isA<List<Motel>>());
    verify(networkService.get(EndPoints.getMotels)).called(1);
  });

  test('should return a empty list of motels', () async {
    when(networkService.get(EndPoints.getMotels)).thenAnswer(
      (_) async => Future.value(
        NetworkResponseMock.getSuccess(MotelsMock.emptyMotelsResponse),
      ),
    );

    final response = await motelRepository.get();

    expect(response, isEmpty);
    expect(response, isA<List<Motel>>());
    verify(networkService.get(EndPoints.getMotels)).called(1);
  });

  test(
      'should throw ExternalException when there is error related by ApiResponse',
      () async {
    when(networkService.get(EndPoints.getMotels)).thenAnswer(
      (_) async => Future.value(
        NetworkResponseMock.getSuccess(MotelsMock.errorMotelsResponse),
      ),
    );

    await expectLater(motelRepository.get(), throwsA(isA<ExternalError>()));
    verify(networkService.get(EndPoints.getMotels)).called(1);
  });

  test(
      'should throw ExternalException when there is any Exception to get lists of motels',
      () async {
    when(networkService.get(EndPoints.getMotels)).thenThrow(
      (_) async => Future.value(Exception()),
    );

    await expectLater(motelRepository.get(), throwsA(isA<ExternalError>()));
    verify(networkService.get(EndPoints.getMotels)).called(1);
  });

  test('should throw ExternalException when api return a status code error',
      () async {
    when(networkService.get(EndPoints.getMotels)).thenThrow(
      (_) async => Future.value(NetworkResponseMock.getError()),
    );

    await expectLater(motelRepository.get(), throwsA(isA<ExternalError>()));
    verify(networkService.get(EndPoints.getMotels)).called(1);
  });
}
