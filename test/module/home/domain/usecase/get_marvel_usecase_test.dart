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
      'deve retornar um objeto ResultSuccess quando a requisição for bem-sucedida',
      () async {
    when(() => getMarvelDataMock.call()).thenAnswer((_) async {
      return ResultSuccess<MarvelModel>(
        MarvelModel(limit: 100),
      );
    });

    final result = await getMarvelUseCase.call();

    expect(result, isA<ResultSuccess<MarvelModel>>());

    final data = (result as ResultSuccess<MarvelModel>).getSuccessData;
    expect(data.limit, 100);
  });

  test('deve retornar um objeto ResultError quando a requisição falhar',
      () async {
    when(() => getMarvelDataMock.call()).thenAnswer((_) async {
      return ResultError(BaseError('Erro na requisição'));
    });

    final result = await getMarvelUseCase.call();

    expect(result, isA<ResultError>());
  });
}
