import 'package:character/module/home/datasource/data/get_marvel_data.dart';
import 'package:character/module/home/domain/usecase/get_marvel_usecase.dart';
import 'package:character/module/home/ui/bloc/marvel_list_bloc.dart';
import 'package:character/module/home/ui/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<IGetMarvelData>(GetMarvelData.new);
    i.addSingleton<IGetMarvelUseCase>(GetMarvelUseCase.new);
    i.addSingleton<IMarvelListBloc>(MarvelListBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
