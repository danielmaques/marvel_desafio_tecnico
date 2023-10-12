import 'package:bloc_test/bloc_test.dart';
import 'package:character/core/result_wrapper/result_wrapper.dart';
import 'package:character/core/states/base_page_state.dart';
import 'package:character/module/details/datasource/model/comics_model.dart';
import 'package:character/module/details/domain/usecase/get_details_comics_usecase.dart';
import 'package:character/module/details/ui/bloc/comics_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ComicsDetalsUseCaseMock extends Mock
    implements IGetDetailsComicsUseCase {}

void main() {
  late IGetDetailsComicsUseCase useCase;
  late IComicsDetailsBloc bloc;

  final resultSuccess = ComicsModel();

  setUp(() {
    useCase = ComicsDetalsUseCaseMock();
    bloc = ComicsDetailsBloc(useCase);
  });

  group('ComicsDetailsBloc - Test', () {
    blocTest<IComicsDetailsBloc, BaseState>(
      '[Bloc] - Should return is states [LoadingState and SuccessState]',
      build: () => bloc,
      setUp: () {
        when(() => useCase(1))
            .thenAnswer((_) async => ResultSuccess(resultSuccess));
      },
      act: (_) {
        bloc(id: 1);
      },
      expect: () => [
        isA<LoadingState>(),
        isA<SuccessState<ComicsModel>>(),
      ],
    );
  });
}
