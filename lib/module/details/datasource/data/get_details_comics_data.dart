import 'package:character/core/errors/base_error.dart';
import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/details/datasource/model/comics_model.dart';
import 'package:dio/dio.dart';

abstract class IGetDetailsComicsData {
  Future<Result<ComicsModel>> call(int id);
}

class GetDetailsComicsData implements IGetDetailsComicsData {
  final Dio dio = Dio();
  final String url = 'http://gateway.marvel.com/v1/public/characters/';


  @override
  Future<Result<ComicsModel>> call(int id) async {
    try {
      final response = await dio.get('$url$id/comics', queryParameters: {
        "apikey": "916f445349c33c33d9a6d7ab3039e64a",
        "ts": "1",
        "hash": "f2f24e39ea905aec0f00ecdeadb12376",
      });

      return ResultSuccess<ComicsModel>(
        ComicsModel.fromJson(response.data['data']),
      );
    } catch (e) {
      return ResultError(BaseError('Error: $e'));
    }
  }
}
