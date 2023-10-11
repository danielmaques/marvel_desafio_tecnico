import 'package:character/core/states/base_page_state.dart';
import 'package:character/module/details/domain/usecase/get_details_comics_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IComicsDetailsBloc extends Cubit<BaseState> {
  IComicsDetailsBloc() : super(const EmptyState());

  Future<void> call({required int id});
}

class ComicsDetailsBloc extends IComicsDetailsBloc {
  final IGetDetailsComicsUseCase getDetailsComicsUseCase;

  ComicsDetailsBloc(this.getDetailsComicsUseCase);

  @override
  Future<void> call({required int id}) async {
    emit(const LoadingState());

    try {
      final result = await getDetailsComicsUseCase(id);
      emit(SuccessState(result.getSuccessData));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
