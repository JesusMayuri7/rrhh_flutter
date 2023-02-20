import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsListDocumentos(BuildContext context) {
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
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 60,
      columnName: 'control',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Control',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 60,
      columnName: 'estado',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 45,
      columnName: 'tipo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tipo',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 120,
      columnName: 'expediente_pvn',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Exp. PVN',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 170,
      columnName: 'numero_pvn',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'N° Doc. PVN',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 400,
      columnName: 'asunto',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Asunto',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 110,
      columnName: 'fecha',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fec. Asig.',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 110,
      columnName: 'fecha_derivacion',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fec. Deriv.',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 250,
      columnName: 'remite',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Remite',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 190,
      columnName: 'destino',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Destino',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 85,
      columnName: 'expediente_mtc',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Exp. MTC',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 85,
      columnName: 'expediente_mef',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Exp. MEF',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 180,
      columnName: 'detalle',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Detalle',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 40,
      columnName: 'acciones',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Acción',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
    ),
  ]);
}
