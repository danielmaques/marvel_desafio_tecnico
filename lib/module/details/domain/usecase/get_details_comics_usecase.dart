import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/module/details/datasource/data/get_details_comics_data.dart';
import 'package:character/module/details/datasource/model/comics_results_model.dart';

abstract class IGetDetailsComicsUseCase {
  Future<Result<List<ComicsResultsModel>>> call(int id);
}

class GetDetailsComicsUseCase implements IGetDetailsComicsUseCase {
  final IGetDetailsComicsData getDetailsComicsData;

  GetDetailsComicsUseCase(this.getDetailsComicsData);

  @override
  Future<Result<List<ComicsResultsModel>>> call(int id) {
    return getDetailsComicsData(id);
  }
}
