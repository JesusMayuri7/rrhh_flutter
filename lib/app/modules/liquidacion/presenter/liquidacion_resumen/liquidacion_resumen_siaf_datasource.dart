import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_resumen_entity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LiquidacionResumenSiafDatasource extends DataGridSource {
  List<LiquidacionResumenEntity> liquidacionResumenSiaf = [];
  List<DataGridRow> _liquidacionResumenDataGridRows = [];

  LiquidacionResumenSiafDatasource({
    required this.liquidacionResumenSiaf,
  }) {
    buildDataGridRows();
  }

  @override
  List<DataGridRow> get rows => _liquidacionResumenDataGridRows;

  void buildDataGridRows() {
    _liquidacionResumenDataGridRows = liquidacionResumenSiaf
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'fuente', value: dataGridRow.fuente),
              DataGridCell<String>(
                  columnName: 'finalidad',
                  value: dataGridRow.finalidad == 'Total'
                      ? 'Total ' +
                          dataGridRow.fuente
                              .substring(dataGridRow.fuente.length - 3)
                              .trimRight()
                      : dataGridRow.finalidad),
              DataGridCell<String>(
                  columnName: 'monto_certificado',
                  value: dataGridRow.montoCertificado),
              DataGridCell<String>(
                  columnName: 'monto_liquidacion',
                  value: dataGridRow.montoLiquidacion),
              DataGridCell<String>(
                  columnName: 'monto_devengado',
                  value: dataGridRow.montoDevengado),
              DataGridCell<String>(
                  columnName: 'monto_devolucion',
                  value: dataGridRow.montoDevolucion),
              DataGridCell<String>(
                  columnName: 'saldo', value: dataGridRow.saldo),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final String finalidad = row.getCells()[1].value;
    final String fuente = row.getCells()[0].value;
    Color getRowBackgroundColor() {
      if (finalidad.startsWith('Total'))
        return Colors.green[100] as Color;
      else if (fuente.startsWith('Total'))
        return Colors.blue[200] as Color;
      else
        return Colors.transparent;
    }

    return DataGridRowAdapter(
        color: getRowBackgroundColor(),
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName == 'monto_certificado' ||
              e.columnName == 'monto_liquidacion' ||
              e.columnName == 'monto_devolucion' ||
              e.columnName == 'monto_devengado' ||
              e.columnName == 'saldo') {
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
          } else
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.centerLeft,
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
