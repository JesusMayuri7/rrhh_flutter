import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ImportDataSource extends DataGridSource {
  ImportDataSource(this.context, this.listado) {
    //this.listado.removeAt(0);
    buildDataGridRows();
  }

  List<dynamic> listado = [];

  BuildContext context;

  List<DataGridRow> _importDataGridRows = [];

  @override
  List<DataGridRow> get rows => _importDataGridRows;

  void buildDataGridRows() {
    _importDataGridRows = listado.map<DataGridRow>((dataGridRow) {
      var row = List.from(dataGridRow);
      return DataGridRow(
          cells: row
              .map((e) => DataGridCell<String>(
                  columnName: e.toString(), value: e.toString()))
              .toList());
    }).toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final rowIndex = _importDataGridRows.indexOf(row);
    var backgroundColor = Colors.transparent;
    if ((rowIndex % 2) == 0) {
      backgroundColor = Theme.of(context).backgroundColor.withOpacity(0.7);
    }
    //if ((rowIndex > 0))
    return DataGridRowAdapter(
        color: backgroundColor,
        cells: row.getCells().map<Widget>((e) {
          return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8),
              alignment: Alignment.centerRight,
              child: Text(
                e.value,
                style: TextStyle(fontSize: 12),
                //e.value.toString(),
                // maxLines: 1,
              ));
        }).toList());
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
