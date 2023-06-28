import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_ext_entity.dart';

List<GridColumn> getColumnsAirhspPresupuestoExt(BuildContext context, List<AirhspExtEntity> _columns) {

  
  List<Map<String,dynamic>> columnList = _columns[0].datoLaboral;
  
  //List columnNames = columnList.keys.toList();
      
  var cols = columnList.map((colName) {
    return GridColumn(
       columnName: colName.keys.first,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          colName.keys.first,
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    );    
  }).toList();

  cols.insert(0, GridColumn(
    width: 80,
    columnName: 'codigoPlaza',label: Container(alignment: Alignment.center,
      child: Text('PLAZA',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 11.0),
      ),
    )) );
  return cols;
}
  
  