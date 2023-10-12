import 'dart:io';

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
    'should return a ResultSuccess object when the API call is successful',
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

      expect(result.isSuccess, true);
      expect(result, isA<ResultSuccess<MarvelModel>>());
    },
  );

   test('should return a ResultError object when the API call throws an error',
      () async {
    when(() => dio.get(any())).thenAnswer((_) async {
      return Response(
        data: jsonMockErrorResult,
        statusCode: HttpStatus.badRequest,
        requestOptions: RequestOptions(
          method: 'GET',
          path: '/comics',
        ),
      );
    });

    final result = await getMarvelData.call();
    expect(result.isSuccess, false);
    expect(result, isA<ResultError>());
  });
}


const jsonMockErrorResult = '''
{
	"excecao": {
		"erros": [
			{
			  "codigo": "",
				"mensagem": ""
			}
		]
	}
}
''';

