import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/home/datasource/data/get_marvel_data.dart';
import 'package:character/module/home/datasource/model/marvel_model.dart';

abstract class IGetMarvelUseCase {
  Future<Result<MarvelModel>> call();
}

class GetMarvelUseCase implements IGetMarvelUseCase {
  final IGetMarvelData getMarvelData;

  GetMarvelUseCase(this.getMarvelData);

  @override
  Future<Result<MarvelModel>> call() {
    return getMarvelData();
  }
}
