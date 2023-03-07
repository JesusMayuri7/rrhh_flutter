import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> judicialDetailColumns(BuildContext context) {
  return ([
    GridColumn(
      allowFiltering: false,
      visible: false,
      width: 30,
      columnName: 'id',
      label: Container(
        alignment: Alignment.center,
        child: Tooltip(
          message: 'id',
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            'id',
            style: TextStyle(
                color: Colors.white, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      allowFiltering: false,
      visible: false,
      width: 30,
      columnName: 'judiciales_id',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meta',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowFiltering: false,
      width: 200,
      columnName: 'detalle',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Detalle',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowFiltering: false,
      width: 100,
      columnName: 'Exp. Pvn',
      label: Container(
        alignment: Alignment.centerLeft,
        child: Tooltip(
          message: 'Expediente PVN',
          child: Text(
            'Exp. Pvn',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      allowFiltering: false,
      width: 100,
      columnName: 'nro_documento',
      label: Container(
        alignment: Alignment.center,
       child: Text(
            'N° Doc.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowFiltering: false,
      width: 60,
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
