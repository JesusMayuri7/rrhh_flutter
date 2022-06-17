import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/base_prac/bloc/base_prac_bloc.dart';

import 'presenter/list_prac/list_prac_page.dart';

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
        return Column(
          children: [
            Expanded(
              child: Material(
                child: ListPracPage(),
              ),
            ),
/*             if (state is BasePracLoadingState)
              Center(
                child: CircularProgressIndicator(),
                //   Text('Cargando datos iniciales')
              ),
            if (state is BasePracErrorState)
              Center(
                  child: Container(
                      child: TextButton(
                          child: Text('Error, reintentar'),
                          onPressed: () => {
                                (Modular.get<ListPracBloc>())
                                    .add(ListPracEvent(anio: '2022'))
                              }))) */
          ],
        );
      },
    );
  }
}
