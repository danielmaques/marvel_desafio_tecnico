import 'dart:io';

import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/details/datasource/data/get_details_comics_data.dart';
import 'package:character/module/details/datasource/model/comics_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dio;
  late GetDetailsComicsData getDetailsComicsData;

  setUp(() {
    dio = DioMock();
    getDetailsComicsData = GetDetailsComicsData();
  });

  test('should return a ResultSuccess object when the API call is successful',
      () async {
    final mockResponse = {
      'data': {
        'id': 1,
        'title': 'Spider-Man #1',
      },
    };

    when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async {
      return Response(
        data: mockResponse,
        statusCode: 200,
        requestOptions: RequestOptions(
          method: 'GET',
          path: '/comics',
        ),
      );
    });

    final result = await getDetailsComicsData.call(1);
    expect(result.isSuccess, true);
    expect(result, isA<ResultSuccess<ComicsModel>>());
  });

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

    final result = await getDetailsComicsData.call(1);
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
