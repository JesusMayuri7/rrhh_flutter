import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumns(BuildContext context) {
  return ([
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Codigo Plaza',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'codigo_plaza',
      //columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Presupuesto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'presupuesto',
      width: 110,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'fuente_base',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meta',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'meta_base',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Unidad',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'desc_unidad',
      width: 270,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Area',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'desc_area',
      width: 270,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Cargo',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Theme.of(context).bottomAppBarColor),
          ),
        ),
        columnName: 'cargo',
        width: 450
        // columnWidthMode: ColumnWidthMode.lastColumnFill,
        //columnWidthMode: ColumnWidthMode.fill,
        //width: model.isWeb ? 135 : 90,
        ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'estadoAir',
      width: 130,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      columnName: 'essalud',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      //columnWidthMode: ColumnWidthMode.fill,
      ////columnWidthMode: ColumnWidthMode.fill,
      //textAlignment: Alignment.centerRight,
    ),
    GridColumn(
      width: 45,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meses',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'meses',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'montoAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'essaludAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Aguinaldo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'aguinaldoAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Total Anual',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor),
        ),
      ),
      columnName: 'total',
      //columnWidthMode: ColumnWidthMode.fill,
    )
  ]);
}
