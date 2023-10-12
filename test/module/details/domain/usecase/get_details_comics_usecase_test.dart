import 'package:character/core/errors/base_error.dart';
import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/details/datasource/data/get_details_comics_data.dart';
import 'package:character/module/details/datasource/model/comics_model.dart';
import 'package:character/module/details/domain/usecase/get_details_comics_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetDetailsComicsDataMock extends Mock implements IGetDetailsComicsData {}

void main() {
  late GetDetailsComicsDataMock getDetailsComicsDataMock;
  late IGetDetailsComicsUseCase getDetailsComicsUseCase;

  final resultSuccess = ComicsModel();

  setUpAll(() async {
    getDetailsComicsDataMock = GetDetailsComicsDataMock();
    getDetailsComicsUseCase = GetDetailsComicsUseCase(getDetailsComicsDataMock);
  });

  group('GetDetailsComicsUseCase - Test', () {
    test('when call function then return success', () async {
      when(
        () => getDetailsComicsDataMock(1),
      ).thenAnswer((_) async => ResultSuccess(resultSuccess));

      final result = await getDetailsComicsUseCase(1);

      expect(result.isSuccess, true);
      expect(result, isA<ResultSuccess<ComicsModel>>());
    });

    test('when call function then return error', () async {
      when(
        () => getDetailsComicsDataMock(1),
      ).thenAnswer((_) async => ResultError(BaseError('Error')));

      final result = await getDetailsComicsUseCase(1);

      expect(result.isSuccess, false);
      expect(result, isA<ResultError>());
      expect(result.getErrorData, isA<BaseError>());
    });
  });
}
