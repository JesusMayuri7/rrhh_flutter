import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/presupuesto_cas_entity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PresupuestoCasDs extends DataGridSource {
  PresupuestoCasDs(this.presupuestoList) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    _presupuestoCasDataGridRows = presupuestoList
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'anio', value: dataGridRow.anoEje),
              DataGridCell<String>(
                  columnName: 'fuente', value: dataGridRow.fuente),
              DataGridCell<String>(
                  columnName: 'producto', value: dataGridRow.producto),
              DataGridCell<String>(
                  columnName: 'clasificador', value: dataGridRow.clasificador),
              DataGridCell<num>(columnName: 'pia', value: dataGridRow.pia),
              DataGridCell<num>(columnName: 'pim', value: dataGridRow.pim),
              DataGridCell<num>(
                  columnName: 'certificado', value: dataGridRow.certificado),
              DataGridCell<num>(
                  columnName: 'devengado', value: dataGridRow.devengado),
              DataGridCell<num>(
                  columnName: 'enero', value: dataGridRow.enero),
              DataGridCell<num>(
                  columnName: 'febrero', value: dataGridRow.febrero),
              DataGridCell<num>(
                  columnName: 'marzo', value: dataGridRow.marzo),
              DataGridCell<num>(
                  columnName: 'abril', value: dataGridRow.abril),
              DataGridCell<num>(columnName: 'mayo', value: dataGridRow.mayo),
              DataGridCell<num>(
                  columnName: 'junio', value: dataGridRow.junio),
              DataGridCell<num>(
                  columnName: 'julio', value: dataGridRow.julio),
              DataGridCell<num>(
                  columnName: 'agosto', value: dataGridRow.agosto),
              DataGridCell<num>(
                  columnName: 'setiembre', value: dataGridRow.setiembre),
              DataGridCell<num>(
                  columnName: 'octubre', value: dataGridRow.octubre),
              DataGridCell<num>(
                  columnName: 'noviembre', value: dataGridRow.noviembre),
              DataGridCell<num>(
                  columnName: 'diciembre', value: dataGridRow.diciembre),
            ]))
        .toList();
  }

  List<PresupuestoCasEntity> presupuestoList = [];

  //BuildContext context;

  List<DataGridRow> _presupuestoCasDataGridRows = [];

  @override
  List<DataGridRow> get rows => _presupuestoCasDataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final rowIndex = _presupuestoCasDataGridRows.indexOf(row);
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
              e.columnName == 'diciembre') {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              alignment: Alignment.centerRight,
              child: Text(
                NumberFormat('#,##0.00', 'en_US')
                    .format(num.parse(e.value.toString())),
                style: TextStyle(fontSize: 10.5),
              ),
              //e.value.toString(),
            );
          }
          if (e.columnName == 'mesInicio' || e.columnName == 'mesFin') {
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
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10.5),
              ),
            );
          }
        }).toList());
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
