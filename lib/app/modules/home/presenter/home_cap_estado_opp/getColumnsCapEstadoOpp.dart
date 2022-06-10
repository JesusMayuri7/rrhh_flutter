import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsCapEstadoOpp() {
  return ([
    GridColumn(
      width: 190,
      allowEditing: false,
      columnName: 'desc_unidad',
      label: Container(
        alignment: Alignment.center,
        child: Text('Unidad',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9, color: Colors.white)),
      ),
    ),
    GridColumn(
        width: 40,
        columnName: 'ocupado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Ocupado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 40,
        columnName: 'vacante',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Vacante',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 42,
        columnName: 'reservado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Reservado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 42,
        columnName: 'totales',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Total',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
        ))
  ]);
}
