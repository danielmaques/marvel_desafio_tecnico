import 'package:character/core/errors/base_error.dart';
import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/home/datasource/data/get_marvel_data.dart';
import 'package:character/module/home/datasource/model/marvel_model.dart';
import 'package:character/module/home/domain/usecase/get_marvel_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMarvelDataMock extends Mock implements IGetMarvelData {}

void main() {
  late GetMarvelDataMock getMarvelDataMock;
  late IGetMarvelUseCase getMarvelUseCase;

  setUp(() {
    getMarvelDataMock = GetMarvelDataMock();
    getMarvelUseCase = GetMarvelUseCase(getMarvelDataMock);
  });

  test(
      'when call function then return success',
      () async {
    when(() => getMarvelDataMock.call()).thenAnswer((_) async {
      return ResultSuccess<MarvelModel>(
        MarvelModel(limit: 100),
      );
    });

    final result = await getMarvelUseCase.call();

    expect(result.isSuccess, true);
    expect(result, isA<ResultSuccess<MarvelModel>>());
  });

  test('when call function then return error',
      () async {
    when(() => getMarvelDataMock.call()).thenAnswer((_) async {
      return ResultError(BaseError('Erro na requisição'));
    });

    final result = await getMarvelUseCase.call();

    expect(result.isSuccess, false);
    expect(result, isA<ResultError>());
    expect(result.getErrorData, isA<BaseError>());
  });
}
