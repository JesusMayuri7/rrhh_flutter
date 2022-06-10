import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

Widget _getWidgetForStackedHeaderCell(String title, Color color) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 11.5, color: Colors.white),
      ));
}

List<StackedHeaderRow> getStackedHeaderRows() {
  List<StackedHeaderRow> _stackedHeaderRows;
  _stackedHeaderRows = <StackedHeaderRow>[
    StackedHeaderRow(cells: [
      StackedHeaderCell(columnNames: [
        'cantidadOcupado',
        'montoOcupado',
      ], child: _getWidgetForStackedHeaderCell('Ocupado', Colors.orange)),
      StackedHeaderCell(columnNames: [
        'cantidadVacante',
        'montoVacante',
      ], child: _getWidgetForStackedHeaderCell('Vacante', Colors.green)),
      StackedHeaderCell(columnNames: [
        'cantidadProyectado',
        'montoProyectado',
      ], child: _getWidgetForStackedHeaderCell('Proyectado', Colors.blueGrey)),
      StackedHeaderCell(columnNames: [
        'cantidadTotal',
        'montoTotal',
      ], child: _getWidgetForStackedHeaderCell('Total', Colors.brown)),
    ])
  ];
  return _stackedHeaderRows;
}
