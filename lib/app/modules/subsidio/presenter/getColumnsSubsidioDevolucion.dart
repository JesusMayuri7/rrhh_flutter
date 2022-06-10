import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsSubisioDevolucion() {
  return ([
    GridColumn(
        visible: false,
        columnName: 'id',
        label: Text(
          'ID',
          style: TextStyle(fontSize: 10.5, color: Colors.white),
          textAlign: TextAlign.center,
        )),
    GridColumn(
      width: 40,
      columnName: 'anio',
      label: Container(
        alignment: Alignment.center,
        child: Text('Año',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center),
      ),
    ),
    GridColumn(
      visible: false,
      width: 40,
      columnName: 'modalidad_id',
      label: Text('Modalidad ID',
          style: TextStyle(fontSize: 10.5, color: Colors.white),
          textAlign: TextAlign.center),
    ),
    GridColumn(
      width: 50,
      columnName: 'dsc_modalidad',
      label: Container(
        alignment: Alignment.center,
        child: Text('Modalidad',
            style: TextStyle(fontSize: 10, color: Colors.white),
            textAlign: TextAlign.center),
      ),
    ),
    GridColumn(
      width: 65,
      columnName: 'tipo',
      label: Container(
        alignment: Alignment.center,
        child: Text('Tipo',
            style: TextStyle(fontSize: 10, color: Colors.white),
            textAlign: TextAlign.center),
      ),
    ),
    GridColumn(
      visible: false,
      width: 40,
      columnName: 'certificado_id',
      label: Text('certificado ID',
          style: TextStyle(fontSize: 10.5, color: Colors.white),
          textAlign: TextAlign.center),
    ),
    GridColumn(
        width: 80,
        allowEditing: true,
        columnName: 'dsc_certificado',
        label: Container(
          alignment: Alignment.center,
          child: Text('Certificado',
              style: TextStyle(fontSize: 10.5, color: Colors.white),
              textAlign: TextAlign.center),
        )),
    GridColumn(
        visible: false,
        width: 30,
        columnName: 'fuente_id',
        label: Text('FF',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
    GridColumn(
        width: 40,
        columnName: 'dsc_fuente',
        label: Container(
          alignment: Alignment.center,
          child: Text('Fuente',
              style: TextStyle(fontSize: 10.5, color: Colors.white),
              textAlign: TextAlign.center),
        )),
    GridColumn(
        visible: false,
        width: 280,
        columnName: 'meta_id',
        label: Container(
          alignment: Alignment.center,
          child: Text('Meta ID',
              style: TextStyle(fontSize: 10.5, color: Colors.white),
              textAlign: TextAlign.center),
        )),
    GridColumn(
        width: 220,
        columnName: 'dsc_meta',
        label: Text('Meta',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
    GridColumn(
        width: 70,
        columnName: 'dni',
        label: Text('Dni',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
    GridColumn(
        width: 200,
        columnName: 'nombres',
        label: Text('nombres',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
    GridColumn(
        width: 40,
        columnName: 'expediente',
        label: Text('Exp.',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
    GridColumn(
      visible: false,
      columnName: 'clasificador_id',
      label: Text('Certificado',
          style: TextStyle(fontSize: 10.5, color: Colors.white),
          textAlign: TextAlign.center),
    ),
    GridColumn(
      width: 60,
      columnName: 'dsc_clasificador',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Clasificador',
          style: TextStyle(fontSize: 10.5, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    GridColumn(
        width: 30,
        columnName: 'mes_proceso',
        label: Text('Mes',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center),
        visible: true),
    GridColumn(
      width: 60,
      columnName: 'fecha_devengado',
      label: Text('Fecha Dev.',
          style: TextStyle(fontSize: 10.5, color: Colors.white),
          textAlign: TextAlign.center),
    ),
    GridColumn(
        width: 50,
        columnName: 'monto_devolucion',
        label: Text('Monto',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center),
        visible: true),
    GridColumn(
        allowEditing: true,
        width: 60,
        columnName: 'codigo_plaza',
        label: Text('Codigo \n AIRHSP',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
    GridColumn(
        allowEditing: true,
        width: 60,
        columnName: 'codigo_siga',
        label: Text('Codigo \n SIGA',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
    GridColumn(
      width: 65,
      columnName: 'estado',
      label: Container(
        alignment: Alignment.center,
        child: Text('Estado',
            style: TextStyle(fontSize: 10, color: Colors.white),
            textAlign: TextAlign.center),
      ),
    ),
    GridColumn(
        width: 60,
        columnName: 'acciones',
        label: Text('Acciones',
            style: TextStyle(fontSize: 10.5, color: Colors.white),
            textAlign: TextAlign.center)),
  ]);
}
