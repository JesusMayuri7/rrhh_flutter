import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/new_judicial_detail_use_case.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_detail_entity.dart';

import 'judicial_detail_page.dart';

class JudicialDetailDataSource extends DataGridSource {
  JudicialDetailDataSource(
      {required this.detailJudicial, required this.contextUp});

  List<JudicialDetailEntity> detailJudicial;
  List<DataGridRow> _confianzaDataGridRows = [];
  BuildContext contextUp;

  @override
  List<DataGridRow> get rows => _confianzaDataGridRows;

  void buildDataGridRows() {
    _confianzaDataGridRows = detailJudicial
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<int>(
                  columnName: 'judicial_id', value: dataGridRow.judicialId),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
              DataGridCell<String>(
                  columnName: 'expediente_pvn',
                  value: dataGridRow.expedientePvn),
              DataGridCell<String>(
                  columnName: 'fecha_expediente_pvn',
                  value: dataGridRow.fechaExpedientePvn),
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
          return IconButton(            
            onPressed: detailJudicial[rowIndex].id == 0 ? null: () {              
              showModalDialogJudicialNewDetail(
                  this.contextUp, 
                  ParamsNewJudicialDetail(id: detailJudicial[rowIndex].id,detalle: detailJudicial[rowIndex].detalle,
                   expedientePvn: detailJudicial[rowIndex].expedientePvn,fechaExpedientePvn: detailJudicial[rowIndex].fechaExpedientePvn,
                   judicialId: detailJudicial[rowIndex].judicialId,nroDocumento: detailJudicial[rowIndex].nroDocumento)
                  );
            },
            splashRadius: 16,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            color: Colors.amber,
            highlightColor: Colors.amberAccent, //<-- SEE HERE
            iconSize: 16,
            icon: Icon(
              Icons.edit,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            //padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Text(e.value.toString(), style: TextStyle(fontSize: 12)),
          ),
        );
      }).toList(),
    );
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
