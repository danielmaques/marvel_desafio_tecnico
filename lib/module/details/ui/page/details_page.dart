import 'package:character/module/details/ui/bloc/comics_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late IComicsDetailsBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<IComicsDetailsBloc>();
    bloc.call(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage(''))),
            ),
          ]),
        ],
      ),
    );
  }
}
