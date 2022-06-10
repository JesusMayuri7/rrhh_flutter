import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsLiquidacionResumenSiaf() {
  return ([
    GridColumn(
        width: 100,
        columnName: 'fuente',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Fuente',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 250,
        columnName: 'finalidad',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'finalidad',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 70,
        columnName: 'monto_certificado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Certificado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 70,
        columnName: 'monto_liquidacion',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Liquidacion',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 70,
        columnName: 'monto_devengado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Devengado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 70,
        columnName: 'monto_devolucion',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Devolucion',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 65,
        columnName: 'saldo',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Saldo',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
  ]);
}
