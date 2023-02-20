import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsPresuspuesto(BuildContext context) {
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
      columnName: 'anio',
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
      width: 203,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Especifica',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'especifica3',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'PIA',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
          maxLines: 1,
        ),
      ),
      columnName: 'pia',
      width: 85,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
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
            'Certificado',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
          ),
        ),
        columnName: 'certificado',
        width: 85
        // columnWidthMode: ColumnWidthMode.lastColumnFill,
        //columnWidthMode: ColumnWidthMode.fill,
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
          'Enero',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'enero',
      width: 79,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Febrero',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'febrero',
      width: 79,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Marzo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'marzo',
      width: 79,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Abril',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'abril',
      width: 79,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Mayo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'mayo',
      width: 79,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Junio',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'junio',
      width: 79,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Julio',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'julio',
      width: 79,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Agosto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'agosto',
      width: 79,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      width: 79,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'setiembre',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 10.0),
        ),
      ),
      columnName: 'setiembre',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 79,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Octubre',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 10.0),
        ),
      ),
      columnName: 'octubre',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 79,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Noviembre',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'noviembre',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 79,
      columnName: 'diciembre',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Diciembre',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      //columnWidthMode: ColumnWidthMode.fill,
      ////columnWidthMode: ColumnWidthMode.fill,
      //textAlignment: Alignment.centerRight,
    ),
  ]);
}
