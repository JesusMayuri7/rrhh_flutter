import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'bloc/base_prac_bloc.dart';
import 'presenter/list_prac/list_prac_page.dart';

class MainPracPage extends StatefulWidget {
  MainPracPage({Key? key}) : super(key: key);

  @override
  _MainPracPageState createState() => _MainPracPageState();
}

class _MainPracPageState extends State<MainPracPage> {
  final blocPrac = Modular.get<BasePracBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasePracBloc, BasePracState>(
      listener: (context, state) => {
        if (state is BasePracErrorState)
          {showToastError(context, state.message)}
      },
      bloc: this.blocPrac,
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
