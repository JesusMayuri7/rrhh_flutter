import 'package:flutter/material.dart';
import '../../../../domain/entities/airhsp_entity.dart';

import '../../../bloc/conceptos_bloc/conceptos_bloc.dart';

import 'item_list_widget.dart';

class ListaPage extends StatelessWidget {
  final ConceptosBloc bloc;
  final List<AirhspEntity> listado;
  final String tipoPersona;

  ListaPage(this.bloc, this.listado, this.tipoPersona, Key? key)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Expanded(
        child: ListView.builder(
            controller: _scrollController,
            //key: ValueKey(tipoPersona),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listado.length,
            itemBuilder: (context, i) {
              return ItemListPage(this.bloc, listado[i], tipoPersona);
            }));
  }
}
