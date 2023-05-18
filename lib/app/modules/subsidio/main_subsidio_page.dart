import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/app/modules/subsidio/bloc/subsidio_bloc.dart';

import 'package:rrhh_clean/app/modules/subsidio/presenter/subsidio_devolucion_page.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

class MainSubsidioPage extends StatelessWidget {
  MainSubsidioPage({Key? key}) : super(key: key);

  final appService = Modular.get<AppService>();
  final blocSubsidio = Modular.get<SubsidioBloc>();

  @override
  Widget build(BuildContext context) {
    final String anioSelected = appService.sessionEntity!.anio;
    this.blocSubsidio.add(SubsidioDataInitialLoad(anio: anioSelected));
    return BlocConsumer<SubsidioBloc, SubsidioState>(
      listener: (context, state) {
        if (state is SubsidioError) {
          showToastError(context, state.message);
        }
      },
      bloc: this.blocSubsidio,
      builder: (context, state) {
        if (state is SubsidioLoaded)
          return Material(child: Container(child: SubsidioDevolucionPage()));
        if (state is SubsidioError)
          return Center(
              child: Container(child: Text('Error, ${state.message}')));
        if (state is SubsidioLoading)
          return Center(child: CircularProgressIndicator());
        else
          return Center(
              child: Container(child: Text('Error, intente otra vez')));
      },
    );
  }
}
