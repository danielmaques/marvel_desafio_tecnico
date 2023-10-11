import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/home/datasource/data/get_marvel_data.dart';
import 'package:character/module/home/datasource/model/marvel_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dio;
  late IGetMarvelData getMarvelData;

  setUp(() {
    dio = DioMock();
    getMarvelData = GetMarvelData();
  });

  test(
    'deve retornar um objeto ResultSuccess quando a requisição for bem-sucedida',
    () async {
      when(() => dio.get(any())).thenAnswer((_) async {
        return Response(
          data: {
            'data': {
              'id': 1,
              'name': 'Spider-Man',
            },
          },
          statusCode: 200,
          requestOptions: RequestOptions(
            method: 'GET',
            path: '/exemplo',
          ),
        );
      });

      final result = await getMarvelData.call();

      expect(result, isA<ResultSuccess<MarvelModel>>());

      final data = (result as ResultSuccess<MarvelModel>).getSuccessData;
      expect(data.limit, 100);
    },
  );
}
