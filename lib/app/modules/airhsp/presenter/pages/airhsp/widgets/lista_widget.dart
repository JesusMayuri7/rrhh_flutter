import 'package:flutter/material.dart';
import '../../../../domain/entities/airhsp_entity.dart';

import '../../../bloc/conceptos_bloc/conceptos_bloc.dart';

import 'item_list_widget.dart';

class ListaPage extends StatelessWidget {
  final ConceptosBloc bloc;
  final List<AirhspEntity> listado;
  final String tipoPersona;

  ListaPage(this.bloc, this.listado, this.tipoPersona);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listado.length,
            itemBuilder: (context, i) {
              return ItemListPage(this.bloc, listado[i], tipoPersona);
            }));
  }
}
