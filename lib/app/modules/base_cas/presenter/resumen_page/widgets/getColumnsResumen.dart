import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsResumen(BuildContext context) {
  return ([
    GridColumn(
      width: 45,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Año',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'anoEje',
      //columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'fuente',
      width: 50,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      width: 240,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Producto',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'producto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 253,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Especifica',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'especifica',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'PIM',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'pim',
      width: 85,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Devengado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'devengado',
      width: 85,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cant.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'cantidadOcupado',
      width: 35,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Proyectado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'montoOcupado',
      width: 85,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cant.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'cantidadVacante',
      width: 35,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Proyectado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'montoVacante',
      width: 85,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cant.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'cantidadProyectado',
      width: 35,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Proyectado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'montoProyectado',
      width: 85,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cant.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'cantidadTotal',
      width: 35,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Proyectado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'montoTotal',
      width: 85,
    ),
    GridColumn(
      width: 89,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Saldo',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 10.0),
        ),
      ),
      columnName: 'saldo',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
  ]);
}
