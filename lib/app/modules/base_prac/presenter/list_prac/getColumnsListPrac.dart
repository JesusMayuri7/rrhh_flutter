import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsListPrac(BuildContext context) {
  return ([
    GridColumn(
      allowEditing: false,
      width: 35,
      columnName: 'anio',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Año',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 45,
      columnName: 'codigo_plaza',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Airhsp',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 50,
      columnName: 'plaza',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Plaza',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 50,
      columnName: 'fuente_base',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 50,
      columnName: 'sede',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sede',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 50,
      columnName: 'meta',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'meta',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 190,
      columnName: 'finalidad',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'finalidad',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      visible: false,
      width: 200,
      columnName: 'desc_unidad',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Unidad',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 180,
      columnName: 'desc_area',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Area',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 170,
      columnName: 'cargo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'cargo',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 60,
      columnName: 'dni',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Dni',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 200,
      columnName: 'nombres',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'nombres',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 50,
      columnName: 'monto_base',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 50,
      columnName: 'tipo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'tipo',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 60,
      columnName: 'estado',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'estado',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      visible: false,
      width: 60,
      columnName: 'estado_actual',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 65,
      columnName: 'fecha_alta',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Alta',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 65,
      columnName: 'fecha_baja',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Baja',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: true,
      width: 80,
      columnName: 'tramite',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tramite',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 200,
      columnName: 'nro_tramite',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'N° Tramite',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 260,
      columnName: 'detalle',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'detalle',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 60,
      columnName: 'fuente_air',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 60,
      columnName: 'estado_pap',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'estado_pap',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 60,
      columnName: 'estado_opp',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'estado_opp',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 70,
      columnName: 'estados',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'estados',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 80,
      columnName: 'estado_air',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado AIR',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 80,
      columnName: 'modalidad',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Modalidd',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 64,
      columnName: 'acciones',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Acciones',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
  ]);
}
