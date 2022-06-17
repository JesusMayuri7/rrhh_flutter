import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/listado_confianza/listado_confianza_page.dart';

import 'bloc/confianza_bloc.dart';

class ConfianzaPage extends StatefulWidget {
  final String title;
  const ConfianzaPage({Key? key, this.title = "Confianza"}) : super(key: key);

  @override
  _ConfianzaPageState createState() => _ConfianzaPageState();
}

class _ConfianzaPageState extends State<ConfianzaPage> {
  final blocConfianza = Modular.get<ConfianzaBloc>();

  @override
  void initState() {
    super.initState();
    if ((this.blocConfianza.state is ConfianzaInitial)) {
      this.blocConfianza.add(ConfianzaAreaEventLoading());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ConfianzaBloc, ConfianzaState>(
          bloc: this.blocConfianza,
          builder: (context, state) {
            if (state is ConfianzaAreaStateLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListadoConfianzaPage(),
                ],
              );
            } else if (state is ConfianzaAreaStateLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ConfianzaAreaStateError) {
              return Text('Error de conexion');
            } else
              return Center(
                child: Text(
                    'Error al cargar datos iniciales, ' + state.toString()),
              );
          },
        ),
      ),
    );
  }
}
