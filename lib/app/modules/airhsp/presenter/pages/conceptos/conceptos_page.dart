import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../bloc/conceptos_bloc/conceptos_bloc.dart';
import '../widgets/message_display_widget.dart';
import 'item_concepto_widget.dart';

//import 'package:file/file.dart';

class ConceptosPage extends StatelessWidget {
  final String codPlaza;
  final String nombres;
  final String tipoPersona;
  final blocConceptos = Modular.get<ConceptosBloc>();
  ConceptosPage(
      {required this.codPlaza,
      required this.nombres,
      required this.tipoPersona}) {
    blocConceptos.add(ConceptosLoadEvent(
        ejecutora: '1078',
        codPlaza: this.codPlaza,
        tipoPersona: this.tipoPersona,
        nombres: this.nombres));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conceptos'),
      ),
      body: BlocBuilder<ConceptosBloc, ConceptosState>(
        bloc: blocConceptos,
        builder: (context, state) {
          return Column(children: <Widget>[
            if (state is ConceptosInitialState)
              Container()
            else if (state is ConceptosLoadingState)
              CircularProgressIndicator()
            else if (state is ConceptosLoadedState)
              ItemConceptoPage(
                conceptos: state.conceptos,
                codPlaza: this.codPlaza,
                nombres: this.nombres,
              )
            else if (state is ConceptosErrorState)
              MessageDisplay(message: state.message)
            else
              Container()
          ]);
        },
      ),
    );
  }
}
