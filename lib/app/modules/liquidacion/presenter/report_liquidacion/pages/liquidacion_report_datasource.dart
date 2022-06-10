import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_report_entity.dart';

class LiquidacionReportDatasource extends DataGridSource {
  List<LiquidacionReportEntity> liquidacionReport = [];
  List<DataGridRow> _liquidacionReportDataGridRows = [];

  LiquidacionReportDatasource({
    required this.liquidacionReport,
  }) {
    buildDataGridRows();
  }

  @override
  List<DataGridRow> get rows => _liquidacionReportDataGridRows;

  void buildDataGridRows() {
    _liquidacionReportDataGridRows = liquidacionReport
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'clasificador', value: dataGridRow.anio),
              DataGridCell<String>(
                  columnName: 'dsc_modalidad', value: dataGridRow.dscModalidad),
              DataGridCell<String>(
                  columnName: 'dsc_certificado_devengado',
                  value: dataGridRow.dscCertificado),
              DataGridCell<String>(
                  columnName: 'dsc_producto', value: dataGridRow.dscProducto),
              DataGridCell<int>(
                  columnName: 'meta_devengado_id', value: dataGridRow.fuenteId),
              DataGridCell<String>(
                  columnName: 'finalidad_devengado',
                  value: dataGridRow.finalidad),
              DataGridCell<String>(
                  columnName: 'dsc_clasificador',
                  value: dataGridRow.dscClasificador),
              DataGridCell<double>(
                  columnName: 'monto_certificado',
                  value: dataGridRow.montoCertificado),
                                DataGridCell<double>(
                  columnName: 'monto_liquidacion',
                  value: dataGridRow.montoLiquidacion),
              DataGridCell<double>(
                  columnName: 'monto_devengado',
                  value: dataGridRow.montoDevengado),
              DataGridCell<double>(
                  columnName: 'total_certificado',
                  value: dataGridRow.totalCertificado),
              DataGridCell<double>(
                  columnName: 'total_devengado',
                  value: dataGridRow.totalDevengado),

              DataGridCell<double>(
                  columnName: 'diff_devengado',
                  value: dataGridRow.diffDevengado),
              DataGridCell<double>(
                  columnName: 'saldo_devengado',
                  value: dataGridRow.saldoDevengado),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = _liquidacionReportDataGridRows.indexOf(row);

    Color getRowBackgroundColor() {
      final double devengado = row
          .getCells()
          .where((element) => element.columnName == 'total_devengado')
          .first
          .value;
      final double liquidado = row
          .getCells()
          .where((element) => element.columnName == 'monto_liquidacion')
          .first
          .value;
      if (devengado == liquidado && (devengado + liquidado) > 0)
        return Colors.green[100]!;
      else if (devengado != liquidado && liquidado > 0)
        return Colors.amber[200]!;
      else
        return Colors.transparent;
    }

    return DataGridRowAdapter(
        color: getRowBackgroundColor(),
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName == 'total_certificado' ||
              e.columnName == 'total_devengado' ||
              e.columnName == 'monto_devengado' ||
              e.columnName == 'monto_certificado' ||
              e.columnName == 'monto_liquidacion' ||
              e.columnName == 'saldo_devengado') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.centerRight,
                child: Text(
                  NumberFormat('#,##0.00', 'en_US').format(
                    double.parse(e.value.toString()),
                  ),
                  style: TextStyle(fontSize: 10),
                  //e.value.toString(),
                  maxLines: 1,
                ));
          } else if (e.columnName == 'diff_devengado') {
            return Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  NumberFormat('#,##0.00', 'en_US').format(
                    double.parse(e.value.toString()),
                  ),
                  style: TextStyle(
                      color: (e.value != 0) ? Colors.red : Colors.black,
                      fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          } else if (e.columnName == 'finalidad_devengado' ||
              e.columnName == 'dsc_producto') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.centerLeft,
                child: Text(
                  e.value.toString(),
                  style: TextStyle(fontSize: 10),
                ));
          } else
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.center,
                child: Text(
                  e.value.toString(),
                  style: TextStyle(fontSize: 10),
                ));
        }).toList());
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
