import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/resumen_entity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ResumenCasDs extends DataGridSource {
  ResumenCasDs(this.resumenList) {
    //print(resumenList[0].nombres);
    buildDataGridRows();
  }

  void buildDataGridRows() {
    //print(resumenList[0].fuenteBase);
    _resumenCasDataGridRows = resumenList
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'anoEje', value: dataGridRow.anoEje),
              DataGridCell<String>(
                  columnName: 'fuente', value: dataGridRow.fuente),
              DataGridCell<String>(
                  columnName: 'producto', value: dataGridRow.producto),
              DataGridCell<String>(
                  columnName: 'especifica', value: dataGridRow.especifica),
              DataGridCell<double>(columnName: 'pim', value: dataGridRow.pim),
              DataGridCell<double>(
                  columnName: 'devengado', value: dataGridRow.devengado),
              DataGridCell<int>(
                  columnName: 'cantidadOcupado',
                  value: dataGridRow.cantidadOcupado),
              DataGridCell<double>(
                  columnName: 'montoOcupado', value: dataGridRow.montoOcupado),
              DataGridCell<int>(
                  columnName: 'cantidadVacante',
                  value: dataGridRow.cantidadVacante),
              DataGridCell<double>(
                  columnName: 'montoVacante', value: dataGridRow.montoVacante),
              DataGridCell<int>(
                  columnName: 'cantidadProyectado',
                  value: dataGridRow.cantidadProyectado),
              DataGridCell<double>(
                  columnName: 'montoProyectado',
                  value: dataGridRow.montoProyectado),
              DataGridCell<int>(
                  columnName: 'cantidadTotal',
                  value: dataGridRow.cantidadTotal),
              DataGridCell<double>(
                  columnName: 'montoTotal', value: dataGridRow.montoTotal),
              DataGridCell<double>(
                  columnName: 'saldo', value: dataGridRow.saldo),
            ]))
        .toList();
  }

  List<ResumenEntity> resumenList = [];

  //BuildContext context;

  List<DataGridRow> _resumenCasDataGridRows = [];

  @override
  List<DataGridRow> get rows => _resumenCasDataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final rowIndex = _resumenCasDataGridRows.indexOf(row);
    var backgroundColor = Colors.white;
    if ((rowIndex % 2) == 0) {
      // backgroundColor = Theme.of(context).backgroundColor.withOpacity(0.7);
    }
    return DataGridRowAdapter(
        color: backgroundColor,
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName == 'pia' ||
              e.columnName == 'pim' ||
              e.columnName == 'certificado' ||
              e.columnName == 'devengado' ||
              e.columnName == 'montoOcupado' ||
              e.columnName == 'montoVacante' ||
              e.columnName == 'montoProyectado' ||
              e.columnName == 'montoTotal') {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              alignment: Alignment.centerRight,
              child: Text(
                NumberFormat('#,##0.00', 'en_US')
                    .format(double.parse(e.value.toString())),
                style: TextStyle(fontSize: 10.5),
              ),
              //e.value.toString(),
            );
          }
          if (e.columnName == 'cantidadOcupado' ||
              e.columnName == 'cantidadProyectado' ||
              e.columnName == 'cantidadVacante' ||
              e.columnName == 'cantidadTotal') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                alignment: Alignment.center,
                child: Text(
                  e.value.toString(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 10),
                ));
          }
          if (e.columnName == 'cantidadOcupado' ||
              e.columnName == 'cantidadProyectado' ||
              e.columnName == 'cantidadVacante' ||
              e.columnName == 'cantidadTotal') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                alignment: Alignment.center,
                child: Text(
                  e.value.toString(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 10.5),
                ));
          }
          if (e.columnName == 'saldo') {
            if (e.value > 0) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                alignment: Alignment.centerRight,
                child: Text(
                  NumberFormat('#,##0.00', 'en_US')
                      .format(double.parse(e.value.toString())),
                  style: TextStyle(fontSize: 10),
                ),
                //e.value.toString(),
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                alignment: Alignment.centerRight,
                child: Text(
                  NumberFormat('#,##0.00', 'en_US')
                      .format(double.parse(e.value.toString())),
                  style: TextStyle(fontSize: 10, color: Colors.red),
                ),
                //e.value.toString(),
              );
            }
          } else {
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              child: Text(
                e.value.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),
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
