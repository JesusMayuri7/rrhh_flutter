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
                  columnName: 'judicial_id', value: dataGridRow.judicialId),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
              DataGridCell<String>(
                  columnName: 'expediente_pvn', value: dataGridRow.expedientePvn),
              DataGridCell<String>(
                  columnName: 'fecha_expediente_pvn', value: dataGridRow.fechaExpedientePvn),    
                                DataGridCell<String>(
                  columnName: 'nro_documento', value: dataGridRow.nroDocumento),               
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
//                  _showModalDialogJudicialNewDetail(context,this.judicialId, this.judicialDetailBloc);
              },
            ),
          );
        }
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
                  //padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(e.value.toString(),style: TextStyle(fontSize: 12)),
                ),
          );
      }).toList(),
    );
  }

 
  void updateDataGrid() {
    notifyListeners();
  }
}
