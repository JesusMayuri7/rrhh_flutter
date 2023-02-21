import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> requerimientos_list_columns(BuildContext context) {
  return ([
    GridColumn(
      width: 60,
      columnName: 'anio',
      label: Container(
        alignment: Alignment.center,
        child: Tooltip(
          message: 'Año',
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            'Año',
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      width: 80,
      columnName: 'desc_modalidad',
      label: Container(
        alignment: Alignment.centerLeft,
        child: Tooltip(
          message: 'Modalidad',
          child: Text(
            'Modalidad',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          ),
        ),
      ),
    ),
        GridColumn(
      width: 100,
      columnName: 'presupuesto',
      label: Container(
        alignment: Alignment.centerLeft,
        child: Tooltip(
          message: 'Presupuesto',
          child: Text(
            'Presupuesto',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      width: 250,
      columnName: 'desc_unidad',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Unidad',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 200,
      columnName: 'dcto_solicitud',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          'N° Solicitud',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 110,
      columnName: 'nro_expediente',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'N° Exp.',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 100,
      columnName: 'fecha_expediente',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fec. Exp.',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 60,
      columnName: 'cantidad',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cantidad',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 60,
      columnName: 'acciones',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Acciones',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
  ]);
}
