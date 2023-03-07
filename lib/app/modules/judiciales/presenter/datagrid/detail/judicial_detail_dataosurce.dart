import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_detail_entity.dart';


class JudicialDetailDataSource extends DataGridSource {
  JudicialDetailDataSource({
    required this.detailJudicial,
  });

  List<JudicialDetailEntity> detailJudicial;
  List<DataGridRow> _confianzaDataGridRows = [];

  @override
  List<DataGridRow> get rows => _confianzaDataGridRows;

  void buildDataGridRows() {
    _confianzaDataGridRows = detailJudicial
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'id', value: dataGridRow.id),
              DataGridCell<int>(
                  columnName: 'desc_meta', value: dataGridRow.judicialId),
              DataGridCell<String>(
                  columnName: 'desc_area', value: dataGridRow.detalle),
              DataGridCell<String>(
                  columnName: 'cargo', value: dataGridRow.expedientePvn),
              DataGridCell<String>(
                  columnName: 'cantidad', value: dataGridRow.fechaExpedientePvn),              
              DataGridCell<JudicialDetailEntity>(
                  columnName: 'acciones', value: dataGridRow),
            ]))
        .toList();
    //_confianzaDataGridRows.add(DataGridRow(cells: [DataGridCell<String>(columnName: 'acciones', value: 'edit')]));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = _confianzaDataGridRows.indexOf(row);

    return DataGridRowAdapter(
      //color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'acciones') {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8),
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.amber[800],
                size: 14,
              ),
              onPressed: () {
                //_showModalDialog(this.context, e.value);
              },
            ),
          );
        }
        if (e.columnName == 'plaza' ||
            e.columnName == 'dni' ||
            e.columnName == 'modalidad') {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 10.5),
            ),
          );
        } else
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 10.5),
              overflow: TextOverflow.ellipsis,
            ),
          );
      }).toList(),
    );
  }

 
  void updateDataGrid() {
    notifyListeners();
  }
}
