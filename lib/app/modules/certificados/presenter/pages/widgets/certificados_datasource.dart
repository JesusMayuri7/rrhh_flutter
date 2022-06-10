import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../domain/entities/certificado_entity.dart';

class CertififadosDataSource extends DataGridSource {
  CertififadosDataSource(this.context, this.listadoCertificados) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    //print(basecasList[0].fuenteBase);
    _baseCasDataGridRows = listadoCertificados
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'dsc_certificado',
                  value: dataGridRow.dscCertificado),
              DataGridCell<int>(
                  columnName: 'ano_eje', value: dataGridRow.anoEje),
              DataGridCell<String>(
                  columnName: 'fuente_base', value: dataGridRow.fuenteBase),
              DataGridCell<String>(
                  columnName: 'clasificador', value: dataGridRow.clasificador),
              DataGridCell<String>(
                  columnName: 'modalidad', value: dataGridRow.modalidad),
              DataGridCell<String>(columnName: 'tipo', value: dataGridRow.tipo),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
              DataGridCell<String>(
                  columnName: 'concepto', value: dataGridRow.concepto),
              DataGridCell<String>(
                  columnName: 'sec_func', value: dataGridRow.secFunc),
              DataGridCell<String>(
                  columnName: 'finalidad', value: dataGridRow.finalidad),
              //  DataGridCell<int>(
              //     columnName: 'idmeta_amual', value: dataGridRow.idmetaAnual),
              DataGridCell<double>(
                  columnName: 'monto', value: dataGridRow.monto),
              DataGridCell<double>(
                  columnName: 'devengado', value: dataGridRow.devengado),
              DataGridCell<double>(
                  columnName: 'saldo', value: dataGridRow.saldo),
              DataGridCell<double>(
                  columnName: 'enero', value: dataGridRow.enero),
              DataGridCell<double>(
                  columnName: 'febrero', value: dataGridRow.febrero),
              DataGridCell<double>(
                  columnName: 'marzo', value: dataGridRow.marzo),
              DataGridCell<double>(
                  columnName: 'abril', value: dataGridRow.abril),
              DataGridCell<double>(columnName: 'mayo', value: dataGridRow.mayo),
              DataGridCell<double>(
                  columnName: 'junio', value: dataGridRow.junio),
              DataGridCell<double>(
                  columnName: 'julio', value: dataGridRow.julio),
              DataGridCell<double>(
                  columnName: 'agosto', value: dataGridRow.agosto),
              DataGridCell<double>(
                  columnName: 'setiembre', value: dataGridRow.setiembre),
              DataGridCell<double>(
                  columnName: 'octubre', value: dataGridRow.octubre),
              DataGridCell<double>(
                  columnName: 'noviembre', value: dataGridRow.noviembre),
              DataGridCell<double>(
                  columnName: 'diciembre', value: dataGridRow.diciembre),
            ]))
        .toList();
  }

  List<CertificadoEntity> listadoCertificados = [];

  BuildContext context;

  List<DataGridRow> _baseCasDataGridRows = [];

  @override
  List<DataGridRow> get rows => _baseCasDataGridRows;

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
        alignment: Alignment.centerRight,
        child: Text(
          NumberFormat('#,##0.00', 'en_US').format(
            double.parse(summaryValue.isEmpty ? '0' : summaryValue),
          ),
          style: TextStyle(fontSize: 12),
          //e.value.toString(),
          maxLines: 1,
        ));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final String dscCertificado = row.getCells().first.value;
    final rowIndex = _baseCasDataGridRows.indexOf(row);
    var backgroundColor = Colors.transparent;
    if ((rowIndex % 2) == 0) {
      if (dscCertificado.isEmpty)
        backgroundColor = Colors.green[100]!;
      else
        backgroundColor = Theme.of(context).backgroundColor.withOpacity(0.7);
    }
    return DataGridRowAdapter(
        color: backgroundColor,
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName == 'monto' ||
              e.columnName == 'devengado' ||
              e.columnName == 'enero' ||
              e.columnName == 'febrero' ||
              e.columnName == 'marzo' ||
              e.columnName == 'abril' ||
              e.columnName == 'mayo' ||
              e.columnName == 'junio' ||
              e.columnName == 'julio' ||
              e.columnName == 'agosto' ||
              e.columnName == 'setiembre' ||
              e.columnName == 'octubre' ||
              e.columnName == 'noviembre' ||
              e.columnName == 'diciembre' ||
              e.columnName == 'saldo') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8),
                alignment: Alignment.centerRight,
                child: Text(
                  NumberFormat('#,##0.00', 'en_US').format(
                    double.parse(e.value.toString()),
                  ),
                  style: TextStyle(fontSize: 12),
                  //e.value.toString(),
                  maxLines: 1,
                ));
          }
          if (e.columnName == 'anoEje') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                alignment: Alignment.center,
                child: Text(
                  e.value.toString(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 10.5),
                ));
          } else {
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              child: Text(
                e.value.toString(),
                style: TextStyle(fontSize: 10.5),
              ),
            );
          }
        }).toList());
  }

  void updateDataGrid() {
    print('actualizando grid');
    notifyListeners();
  }
}
