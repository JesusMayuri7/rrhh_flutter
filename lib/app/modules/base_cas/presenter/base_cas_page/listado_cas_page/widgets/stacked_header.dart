import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

Widget _getWidgetForStackedHeaderCell(String title, Color color) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 11.5, color: Colors.white),
      ));
}

Widget _getWidgetForStackedHeaderFuente(String title, Color color) {
  return Container(
    color: color,
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: title,
        items: ['TODOS', 'RO', 'RDR']
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (value) => {title = value!},
      ),
    ),
  );
}

List<StackedHeaderRow> getStackedHeaderRows() {
  List<StackedHeaderRow> _stackedHeaderRows;
  _stackedHeaderRows = <StackedHeaderRow>[
    StackedHeaderRow(cells: [
      StackedHeaderCell(columnNames: [
        'fuente_base',
      ], child: _getWidgetForStackedHeaderFuente('TODOS', Colors.orange)),
    ])
  ];
  return _stackedHeaderRows;
}
