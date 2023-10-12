import 'package:character/core/errors/base_error.dart';
import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/home/datasource/model/marvel_model.dart';
import 'package:dio/dio.dart';

abstract class IGetMarvelData {
  Future<Result<MarvelModel>> call();
}

class GetMarvelData implements IGetMarvelData {
  final Dio dio;
  final String url =
      'http://gateway.marvel.com/v1/public/characters?apikey=916f445349c33c33d9a6d7ab3039e64a&ts=1&hash=f2f24e39ea905aec0f00ecdeadb12376&limit=100';

  GetMarvelData(this.dio);

  @override
  Future<Result<MarvelModel>> call() async {
    try {
      final response = await dio.get(url);

      return ResultSuccess<MarvelModel>(
        MarvelModel.fromJson(response.data['data']),
      );
    } catch (e) {
      return ResultError(BaseError('Error: $e'));
    }
  }
}
