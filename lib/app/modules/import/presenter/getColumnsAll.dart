import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsAll(BuildContext context, List<String> columns) {
  //int width = 0;
  return columns.map<GridColumn>((col) {
    return GridColumn(
        //width: width.toDouble(),
        //columnWidthMode: ColumnWidthMode.fill,
        columnName: col.toString(),
        label: Text(
          col.toString(),
          style: TextStyle(color: Colors.white, fontSize: 10),
        ));
  }).toList();
}
