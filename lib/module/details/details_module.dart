import 'package:character/module/details/ui/page/details_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'datasource/data/get_details_comics_data.dart';
import 'domain/usecase/get_details_comics_usecase.dart';
import 'ui/bloc/comics_details_bloc.dart';

class DetailsModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<IGetDetailsComicsData>(GetDetailsComicsData.new);
    i.addSingleton<IGetDetailsComicsUseCase>(GetDetailsComicsUseCase.new);
    i.addSingleton<IComicsDetailsBloc>(ComicsDetailsBloc.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => DetailsPage(
              id: r.args.data['id'],
              image: r.args.data['image'],
              name: r.args.data['name'],
              description: r.args.data['description'],
            ));
  }
}
