import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/base_prac/bloc/base_prac_bloc.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/bloc/list_prac_bloc.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/list_prac_page.dart';

class MainPracPage extends StatefulWidget {
  MainPracPage({Key? key}) : super(key: key);

  @override
  _MainPracPageState createState() => _MainPracPageState();
}

class _MainPracPageState extends State<MainPracPage> {
  final bloc = Modular.get<BasePracBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePracBloc, BasePracState>(
      bloc: this.bloc,
      builder: (context, state) {
        if (state is BasePracLoadingState)
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text('Cargando datos iniciales')
            ],
          ));
        else if (state is BasePracLoadedState)
          return Material(
            child: Column(
              children: [ListPracPage()],
            ),
          );
        else
          return Center(
              child: Container(
                  child: TextButton(
                      child: Text('Error, reintentar'),
                      onPressed: () => {
                            (Modular.get<ListPracBloc>())
                                .add(ListPracEvent(anio: '2022'))
                          })));
      },
    );
  }
}
