import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/bloc/subsidio_bloc.dart';

import 'package:rrhh_clean/app/modules/subsidio/presenter/subsidio_devolucion_page.dart';

class MainSubsidioPage extends StatelessWidget {
  MainSubsidioPage({Key? key}) : super(key: key);

  final blocSubsidio = Modular.get<SubsidioBloc>();
  final String anioSelected =
      (Modular.get<AuthBloc>().state as SuccessAuthState)
          .loginResponseEntity
          .anio;

  @override
  Widget build(BuildContext context) {
    this.blocSubsidio.add(SubsidioDataInitialLoad(anio: this.anioSelected));
    return BlocConsumer<SubsidioBloc, SubsidioState>(
      listener: (context, state) {
        if (state is SubsidioError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Error: ' + state.message)));
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
