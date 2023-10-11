import 'package:character/core/states/base_page_state.dart';
import 'package:character/module/home/domain/usecase/get_marvel_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IMarvelListBloc extends Cubit<BaseState> {
  IMarvelListBloc() : super(const EmptyState());

  Future<void> call();
}

class MarvelListBloc extends IMarvelListBloc {
  final IGetMarvelUseCase getMarvelUseCase;

  MarvelListBloc(this.getMarvelUseCase);

  @override
  Future<void> call() async {
    emit(const LoadingState());

    try {
      final result = await getMarvelUseCase();
      emit(SuccessState(result.getSuccessData));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
