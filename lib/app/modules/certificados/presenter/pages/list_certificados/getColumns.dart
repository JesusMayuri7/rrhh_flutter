import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumns(BuildContext context) {
  return ([
    GridColumn(
      width: 78,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Certificado',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dsc_certificado',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 43,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Año',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'anoEje',
      //columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    /*
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'certificado_id',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 11.0),
        ),
      ),
      columnName: 'certificado_id',
      width: 110,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'clasificador_id',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 11.0),
        ),
      ),
      columnName: 'clasificador_id',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'fuente',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 11.0),
        ),
      ),
      columnName: 'fuente',
      width: 270,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),*/
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'fuente_base',
      width: 50,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Clasificador',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          ),
        ),
        columnName: 'clasificador',
        width: 70
        // columnWidthMode: ColumnWidthMode.lastColumnFill,
        //columnWidthMode: ColumnWidthMode.fill,
        //width: model.isWeb ? 135 : 90,
        ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Modalidad',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'modalidad',
      width: 80,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tipo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'tipo',
      width: 120,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      width: 360,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Detalle',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'detalle',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 125,
      columnName: 'concepto',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Concepto',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      //columnWidthMode: ColumnWidthMode.fill,
      ////columnWidthMode: ColumnWidthMode.fill,
      //textAlignment: Alignment.centerRight,
    ),
    GridColumn(
      width: 43,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meta',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'sec_func',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 270,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Finalidad',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'finalidad',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    /*
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'idmeta_anual',
          style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 11.0),
        ),
      ),
      columnName: 'idmeta_anual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),*/
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Certificado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Devengado',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'devengado',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Saldo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'saldo',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Enero',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'enero',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Febrero',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'febrero',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Marzo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'marzo',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Abril',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'abril',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Mayo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'mayo',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Junio',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'junio',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Julio',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'julio',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Agosto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'agosto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Setiembre',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'setiembre',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Octubre',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'octubre',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Noviembre',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'noviembre',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 90,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Diciembre',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'diciembre',
      //columnWidthMode: ColumnWidthMode.fill,
    )
  ]);
}
