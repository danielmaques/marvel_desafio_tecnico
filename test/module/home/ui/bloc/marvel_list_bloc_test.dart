import 'package:bloc_test/bloc_test.dart';
import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/core/states/base_page_state.dart';
import 'package:character/module/home/datasource/model/marvel_model.dart';
import 'package:character/module/home/domain/usecase/get_marvel_usecase.dart';
import 'package:character/module/home/ui/bloc/marvel_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMarvelUseCaseMock extends Mock implements IGetMarvelUseCase {}

void main() {
  late IGetMarvelUseCase useCase;
  late IMarvelListBloc bloc;

  final resultSuccess = MarvelModel();

  setUp(() {
    useCase = GetMarvelUseCaseMock();
    bloc = MarvelListBloc(useCase);
  });

  group('MarvelListBloc - Test', () {
    blocTest<IMarvelListBloc, BaseState>(
      '[Bloc] - Should return is states [LoadingState and SuccessState]',
      build: () => bloc,
      setUp: () {
        when(() => useCase.call())
            .thenAnswer((_) async => ResultSuccess(resultSuccess));
      },
      act: (_) {
        bloc();
      },
      expect: () => [
        isA<LoadingState>(),
        isA<SuccessState<MarvelModel>>(),
      ],
    );
  });
}
