// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';

class DataTableNewRequerimiento extends StatelessWidget {

  final List<RequerimientoDetalleEntity> requerimientoDetalle;

  const DataTableNewRequerimiento({
    Key? key,
    required this.requerimientoDetalle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
                                              columns: [
       DataColumn(
          label: Text("Cant."),
          numeric: true,
       ),
       DataColumn(
          label: Text("Subarea"),
          numeric: false,
         ),
         DataColumn(
          label: Text("Cargo"),
          numeric: false,
         ),
         DataColumn(
          label: Text("Monto"),
          numeric: true,
         ),
       ],
       rows:requerimientoDetalle
    .map(
      (detalle) => DataRow(
          //selected: selectedAvengers.contains(avenger),
          cells: [
            DataCell(
              Text(detalle.cantidad.toString()),
              onTap: () {
                 // write your code..
              },
            ),
              DataCell(
              Text(detalle.descArea),
            ),
            DataCell(
              Text(detalle.cargo),
            ),
              DataCell(
              Text(detalle.monto.toString()),
            ),
          ]),
    )
    .toList(),
                                              ),
    );
  }
}
