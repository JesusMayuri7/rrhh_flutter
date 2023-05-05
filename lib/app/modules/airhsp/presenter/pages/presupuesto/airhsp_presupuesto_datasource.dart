import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'bloc/airhsp_presupuesto_bloc.dart';

class AirhspPresupuestoDataSource extends DataGridSource {
  AirhspPresupuestoDataSource({
    required this.listadoPresupuesto,
    required this.context,
    //required this.areas,
  }) {
    buildDataGridRows();
  }

  List<AirhspPresupuestoEntity> listadoPresupuesto = [];
  BuildContext context;
  List<DataGridRow> _airshpPresupuestoDataGridRows = [];
  final blocPrac = Modular.get<AirhspPresupuestoBloc>();

  @override
  List<DataGridRow> get rows => _airshpPresupuestoDataGridRows;

  void buildDataGridRows() {
    _airshpPresupuestoDataGridRows = listadoPresupuesto
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'codigo_plaza', value: dataGridRow.plaza),
              DataGridCell<String>(columnName: 'dni', value: dataGridRow.dni),
              DataGridCell<String>(
                  columnName: 'nombres', value: dataGridRow.nombres),
              DataGridCell<String>(
                  columnName: 'cargo', value: dataGridRow.cargo),
              DataGridCell<String>(
                  columnName: 'nivel', value: dataGridRow.nivel),
              DataGridCell<String>(
                  columnName: 'estado', value: dataGridRow.estado),
              DataGridCell<num>(
                  columnName: 'rem_prin_ro', value: dataGridRow.remPrinRO),
              DataGridCell<num>(
                  columnName: 'rem_prin_rdr', value: dataGridRow.remPrinRDR),
              DataGridCell<num>(
                  columnName: 'incremento', value: dataGridRow.incremento),
              DataGridCell<num>(
                  columnName: 'bonificacion_familiar',
                  value: dataGridRow.bonificacionFamiliar),
              DataGridCell<num>(
                  columnName: 'essalud', value: dataGridRow.essalud),
            ]))
        .toList();
  }

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return () {
      if (summaryColumn?.columnName == 'rem_prin_ro' ||
          summaryColumn?.columnName == 'rem_prin_rdr' ||
          summaryColumn?.columnName == 'essalud' ||
          summaryColumn?.columnName == 'incremento' ||
          summaryColumn?.columnName == 'bonificacion_familiar') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
            alignment: Alignment.centerRight,
            child: Text(
              NumberFormat('#,##0.00', 'en_US').format(
                num.parse(summaryValue.isEmpty ? '0' : summaryValue),
              ),
              style: TextStyle(fontSize: 12),
              //e.value.toString(),
              maxLines: 1,
            ));
      } else {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
            alignment: Alignment.center,
            child: Text(
              summaryValue,
              style: TextStyle(fontSize: 12),
              //e.value.toString(),
              maxLines: 1,
            ));
      }
    }();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = effectiveRows.indexOf(row);
    Color getRowBackgroundColor() {
      if ((rowIndex % 2) == 0)
        return Colors.transparent;
      else
        return Theme.of(context).scaffoldBackgroundColor;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'anio' ||
            e.columnName == 'codigo_plaza' ||
            e.columnName == 'plaza') {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 11),
            ),
          );
        } else if (e.columnName == 'rem_prin_ro' ||
            e.columnName == 'rem_prin_rdr' ||
            e.columnName == 'essalud' ||
            e.columnName == 'bonificacion_familiar' ||
            e.columnName == 'incremento') {
          return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                right: 5,
              ),
              child: Text(
                NumberFormat('#,##0.00', 'en_US').format(e.value),
                style: TextStyle(fontSize: 11),
              ));
        } else
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 11),
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
