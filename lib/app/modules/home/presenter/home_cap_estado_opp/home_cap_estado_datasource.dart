import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/home/domain/cap_estado_opp_entity.dart';

class HomeCapEstadoOppDataSource extends DataGridSource {
  List<CapEstadoOppEntity> capEstadoOppList = [];

  List<DataGridRow> _capEstadoOppDataGridRows = [];

  HomeCapEstadoOppDataSource({
    required this.capEstadoOppList,
  }) {
    buildDataGridRows();
  }

  @override
  List<DataGridRow> get rows => _capEstadoOppDataGridRows;

  void buildDataGridRows() {
    _capEstadoOppDataGridRows = capEstadoOppList
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'desc_unidad', value: dataGridRow.descUnidad),
              DataGridCell<int>(
                  columnName: 'ocupado', value: dataGridRow.ocupado),
              DataGridCell<int>(
                  columnName: 'vacante', value: dataGridRow.vacante),
              DataGridCell<int>(
                  columnName: 'reservado', value: dataGridRow.reservado),
              DataGridCell<int>(
                  columnName: 'total',
                  value: (dataGridRow.reservado +
                      dataGridRow.ocupado +
                      dataGridRow.vacante)),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = _capEstadoOppDataGridRows.indexOf(row);
    Color backgroundColor = Colors.transparent;
    if ((rowIndex % 2) == 0) {
      backgroundColor = Colors.blue.withOpacity(0.07);
    }

    return DataGridRowAdapter(
        color: backgroundColor,
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName == 'desc_unidad') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.centerLeft,
                child: Text(
                  e.value.toString(),
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ));
          }
          return Container(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
              alignment: Alignment.center,
              child: Text(
                NumberFormat('0', 'en_US').format(
                  double.parse(e.value.toString()),
                ),
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                //e.value.toString(),
                maxLines: 1,
              ));
        }).toList());
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
