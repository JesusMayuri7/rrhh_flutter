import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> judicialDetailColumns(BuildContext context) {
  return ([
    GridColumn(         
      visible: false,   
      width: 30,
      columnName: 'id',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'id',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
              softWrap: true,
        ),
      ),
    ),
    GridColumn(      
      visible: false,    
      width: 30,
      columnName: 'judicial_id',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meta',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
              softWrap: true,
        ),
      ),
    ),
    GridColumn(      
      width: 250,
      columnName: 'detalle',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Detalle',
          style: TextStyle(
              color: Colors.white, fontSize: 11.0),
              softWrap: true,
        ),
      ),
    ),
    GridColumn(
      width: 90,
      columnName: 'expediente_pvn',
      label: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Expediente PVN',   style: TextStyle(
              color: Colors.white, fontSize: 11.0),        
            softWrap: true,
        )  
          ),
        ),    
    GridColumn(
      width: 75,
      columnName: 'fecha_expediente_pvn',
      label: Container(
        alignment: Alignment.center,
       child: Text(
            'F. Exp.', style: TextStyle(
              color: Colors.white, fontSize: 11.0),
softWrap: true,
        ),
      ),
    ),
        GridColumn(
      width: 150,
      columnName: 'nro_documento',
      label: Container(
        alignment: Alignment.center,
       child: Text(
            'N° Doc', style: TextStyle(
              color: Colors.white, fontSize: 11.0),
softWrap: true,
        ),
      ),
    ),
    GridColumn(
      width: 35,
      columnName: 'acciones',
      label: Container(
        alignment: Alignment.center,
        child:   Icon(
      Icons.settings,
      color: Colors.amber,
      size: 16.0,
    ),
      ),
    ),
  ]);
}
