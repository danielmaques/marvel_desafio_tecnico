import 'package:character/core/states/base_page_state.dart';
import 'package:character/module/home/datasource/model/marvel_model.dart';
import 'package:character/module/home/ui/bloc/marvel_list_bloc.dart';
import 'package:character/module/home/ui/widgets/marvel_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IMarvelListBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<IMarvelListBloc>();
    bloc.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is SuccessState<MarvelModel>) {
              var marvel = state.data.results!;
              return ListView.separated(
                itemCount: marvel.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return MarvelTile(
                    onTap: () {
                      Modular.to.pushNamed('/details/', arguments: {
                        'id': marvel[index].id,
                        'image':
                            '${marvel[index].thumbnail!.path!}.${marvel[index].thumbnail!.extension!}',
                        'name': marvel[index].name!,
                        'description': marvel[index].description!,
                      });
                    },
                    image: marvel[index].thumbnail!.path!,
                    extension: marvel[index].thumbnail!.extension!,
                    title: marvel[index].name!,
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
