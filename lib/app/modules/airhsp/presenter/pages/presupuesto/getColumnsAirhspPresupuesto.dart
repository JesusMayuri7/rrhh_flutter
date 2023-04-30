import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsAirhspPresupuesto(BuildContext context) {
  return ([
    GridColumn(
      allowFiltering: false,
      width: 50,
      columnName: 'codigo_plaza',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Plaza',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 70,
      columnName: 'dni',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Dni',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 250,
      columnName: 'nombres',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Nombres',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 100,
      columnName: 'cargo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cargo',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 70,
      columnName: 'nivel',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Nivel',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 80,
      columnName: 'estado',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 75,
      columnName: 'rem_prin_ro',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'RO',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 75,
      columnName: 'rem_prin_rdr',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'RDR',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 80,
      columnName: 'incremento',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'DS-311-2022-EF',
          style: TextStyle(color: Colors.white, fontSize: 10.0),
        ),
      ),
    ),
    GridColumn(
      width: 75,
      columnName: 'bonificacion_familiar',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Bon. Fam.',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 75,
      columnName: 'essalud',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
  ]);
}
