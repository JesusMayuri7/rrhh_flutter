import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> requerimientos_detail_columns(BuildContext context) {
  return ([
    GridColumn(
      width: 60,
      columnName: 'desc_fuente',
      label: Container(
        alignment: Alignment.center,
        child: Tooltip(
          message: 'Fuente',
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            'Fuente',
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      width: 300,
      columnName: 'desc_meta',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meta',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 300,
      columnName: 'desc_area',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Area',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 350,
      columnName: 'cargo',
      label: Container(
        alignment: Alignment.centerLeft,
        child: Tooltip(
          message: 'cargo',
          child: Text(
            'Cargo',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          ),
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
      width: 100,
      columnName: 'monto',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
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
