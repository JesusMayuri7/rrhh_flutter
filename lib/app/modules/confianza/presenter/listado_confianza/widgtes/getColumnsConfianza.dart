import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsConfianza(BuildContext context) {
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
                color: Colors.white, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      width: 80,
      columnName: 'modalidad',
      label: Container(
        alignment: Alignment.centerLeft,
        child: Tooltip(
          message: 'Modalidad',
          child: Text(
            'Modalidad',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      width: 85,
      columnName: 'tipo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          'Tipo',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
      width: 70,
      columnName: 'nro_cap',
      label: Container(
        alignment: Alignment.center,
        child: Tooltip(
          message: 'N° CAP',
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            'N° CAP',
            style: TextStyle(
                color: Colors.white, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      width: 60,
      columnName: 'plaza',
      label: Container(
        alignment: Alignment.center,
        child: Tooltip(
          message: 'AIRHSP',
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            'AIRHSP',
            style: TextStyle(
                color: Colors.white, fontSize: 11.0),
          ),
        ),
      ),
    ),
    GridColumn(
      width: 70,
      columnName: 'estado',
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
      width: 220,
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
      width: 280,
      columnName: 'cargo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cargo',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 70,
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
      width: 250,
      columnName: 'nombres',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Nombres',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 70,
      columnName: 'inicio',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Inicio',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 70,
      columnName: 'fin',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fin',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 150,
      columnName: 'doc_designacion',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Doc. Desig.',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 150,
      columnName: 'doc_cese',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Doc. Cese',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
      width: 150,
      columnName: 'plaza_origen',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Origen',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
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
              color: Colors.white, fontSize: 11.0),
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
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
  ]);
}
