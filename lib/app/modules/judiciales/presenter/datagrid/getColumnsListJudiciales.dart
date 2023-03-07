import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsListJudiciales(BuildContext context) {
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
      width: 100,
      columnName: 'presupuesto',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Ppto.',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 250,
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
      allowEditing: false,
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
      width: 220,
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
      width: 60,
      columnName: 'monto',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto Jud.',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 55,
      columnName: 'nro_cap',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'N° CAP',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 55,
      columnName: 'codigo_plaza',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cod. Plaza',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 50,
      columnName: 'fuente',
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
      width: 220,
      columnName: 'finalidad',
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
      allowEditing: false,
      width: 70,
      columnName: 'fecha_ingreso',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fe. Ing.',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 190,
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
      width: 250,
      columnName: 'nro_expediente_judicial',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Exp. Jud.',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 150,
      columnName: 'estado_procesal',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado Procesal',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      visible: true,
      width: 150,
      columnName: 'expediente_pvn',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Exp. PVN',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      visible: true,
      width: 150,
      columnName: 'expediente_mtc',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Exp. MTC',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      visible: true,
      width: 150,
      columnName: 'expediente_mef',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Expediente MEF',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 200,
      columnName: 'documento_orh',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Documento ORH',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 200,
      columnName: 'Observacion',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Observacion',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      //autoFitPadding: const EdgeInsets.all(0),
      width: 420,
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
      width: 50,
      columnName: 'acciones',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Acción',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
  ]);
}
