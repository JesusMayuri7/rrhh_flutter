import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsAirhspCodigo(BuildContext context) {
  return ([
    GridColumn(
      visible: false,
      allowFiltering: false,
      width: 50,
      columnName: 'id',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Id',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
      allowEditing: false,
      width: 50,
      columnName: 'anio',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Año',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      visible: false,
      allowEditing: false,
      width: 70,
      columnName: 'modalidad_id',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Modalidad Id',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(      
      allowEditing: false,
      width: 100,
      columnName: 'desc_modalidad',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Modalidad',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
      allowEditing: false,
      width: 60,
      columnName: 'codigo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Codigo',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 350,
      columnName: 'desc_codigo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Desc. Codigo',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 150,
      columnName: 'desc_abreviatura',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Desc. Abrev.',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 120,
      columnName: 'modalidad_entrega',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Modalidad',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 120,
      columnName: 'frecuencia_entrega',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Frec. Entrega',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 100,
      columnName: 'frecuencia_mes',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Frec. Mes',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 100,
      columnName: 'tipo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tipo',
          style: TextStyle(color: Colors.white, fontSize: 10.0),
        ),
      ),
    ),
    GridColumn(
      width: 70,
      columnName: 'afecto',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Afecto',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),

    GridColumn(
      width: 100,
      columnName: 'estado',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),   
  ]);
}
