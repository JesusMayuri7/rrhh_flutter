import 'package:flutter/material.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';

List<DropdownMenuItem<ClasificadorEntity>> _buildListClasificador(
    List clasificadorModel) {
  List<DropdownMenuItem<ClasificadorEntity>> listClasificador = [];
  for (ClasificadorEntity item in clasificadorModel) {
    listClasificador.add(DropdownMenuItem(
      value: item,
      child: Text('${item.id}:  ${item.dscClasificador}'),
    ));
  }
  // _clasificadorValue = clasificadorModel[0];
  return listClasificador;
}
