import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsLiquidacionDetalle() {
  return ([
    GridColumn(
        width: 23,
        visible: true,
        columnName: 'id',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'ID',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        )),
    GridColumn(
      width: 65,
      allowEditing: false,
      columnName: 'clasificador',
      label: Container(
        alignment: Alignment.center,
        child: Text('Clasificador',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white)),
      ),
    ),
    GridColumn(
        width: 70,
        columnName: 'monto_certificado',
        label: Text(
          'Certificado \n (a)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white),
        )),
    GridColumn(
        width: 70,
        columnName: 'monto_liquidacion',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Liquidacion',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 70,
        columnName: 'monto_devengado',
        label: Text(
          'Devengado \n (b)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white),
        )),
    GridColumn(
        width: 70,
        columnName: 'monto_devolucion',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Devolucion',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 77,
        columnName: 'saldo',
        label: Text(
          'Saldo \n (c) = (a) - (b)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white),
        )),
  ]);
}
