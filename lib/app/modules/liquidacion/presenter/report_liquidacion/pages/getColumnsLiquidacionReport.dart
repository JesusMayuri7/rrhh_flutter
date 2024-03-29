import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsLiquidacionReport() {
  return ([
    GridColumn(
        width: 60,
        allowFiltering: false,
        columnName: 'anio',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Año',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 50,
        columnName: 'dsc_modalidad',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Modalidad',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'dsc_certificado_devengado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Certificado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 250,
        columnName: 'dsc_producto',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Producto',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 60,
        columnName: 'abv_fuente',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Fuente',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'meta',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Meta',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 210,
        columnName: 'finalidad_devengado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Finalidad',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 65,
        columnName: 'dsc_clasificador',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Clasificador',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'monto_certificado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Monto Cert.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'monto_liquidacion',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Monto Liquid.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'monto_devengado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Monto Deven.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'total_certificado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Total Certificado',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'total_devengado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Total Devengado',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'diff_devengado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Diff. Deveng.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'saldo_devengado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Saldo Dev.',
            //textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
    GridColumn(
        width: 80,
        columnName: 'estado',
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Estado Saldo',
            //textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )),
  ]);
}
