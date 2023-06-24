import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_codigo_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/bloc/codigo_bloc/airhsp_codigo_bloc.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CodigoAirhspDataSource extends DataGridSource {
  CodigoAirhspDataSource({
    required this.listadoPresupuesto,
    required this.context,
    //required this.areas,
  }) {
    buildDataGridRows();
  }

  List<AirhspCodigo> listadoPresupuesto = [];
  BuildContext context;
  List<DataGridRow> _airshpPresupuestoDataGridRows = [];
  final blocPrac = Modular.get<AirhspCodigoBloc>();

  @override
  List<DataGridRow> get rows => _airshpPresupuestoDataGridRows;

  void buildDataGridRows() {
    _airshpPresupuestoDataGridRows = listadoPresupuesto
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<String>(columnName: 'anio', value: dataGridRow.anio),
              DataGridCell<int>(columnName: 'modalidad_id', value: dataGridRow.modalidadId),
              DataGridCell<String>(columnName: 'desc_modalidad', value: dataGridRow.descModalidad),
              DataGridCell<String>(columnName: 'codigo', value: dataGridRow.codigo),
              DataGridCell<String>(
                  columnName: 'desc_codigo', value: dataGridRow.descCodigo),
                  DataGridCell<String>(
                  columnName: 'desc_abreviatura', value: dataGridRow.descAbreviatura),
              DataGridCell<String>(
                  columnName: 'modalidad_entrega', value: dataGridRow.modalidadEntrega),
              DataGridCell<String>(
                  columnName: 'frecuencia_entrega', value: dataGridRow.frecuenciaEntrega),
              DataGridCell<String>(
                  columnName: 'frecuencia_mes', value: dataGridRow.frecuenciaMes),
              DataGridCell<String>(
                  columnName: 'tipo', value: dataGridRow.tipoCodigo),
                  DataGridCell<int>(columnName: 'afecto', value: dataGridRow.afecto),
                  DataGridCell<int>(columnName: 'estado', value: dataGridRow.estado),              
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
          summaryColumn?.columnName == 'essalud_anual' ||
          summaryColumn?.columnName == 'incremento' ||
          summaryColumn?.columnName == 'basico_anual' ||
          summaryColumn?.columnName == 'bonificacion_familiar' ||
          summaryColumn?.columnName == 'escolaridad' ||
          summaryColumn?.columnName == 'gratificacion_julio' ||
          summaryColumn?.columnName == 'gratificacion_diciembre' ||
          summaryColumn?.columnName == 'gratificacion' ||
          summaryColumn?.columnName == 'bonificacion_extraordinaria_julio' ||
          summaryColumn?.columnName == 'bonificacion_extraordinaria_diciembre' ||
          summaryColumn?.columnName == 'bonificacion_extraordinaria' ||
          summaryColumn?.columnName == 'cts_mayo' ||
          summaryColumn?.columnName == 'cts_noviembre' ||
          summaryColumn?.columnName == 'cts' ||
          summaryColumn?.columnName == 'total' 
          ) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
            alignment: Alignment.centerRight,
            child: Text(
              NumberFormat('#,##0.00', 'en_US').format(
                num.parse(summaryValue.isEmpty ? '0' : summaryValue),
              ),
              style: TextStyle(fontSize: 13),
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
        if (e.columnName == 'desc_modalidad' ||
            e.columnName == 'codigo') {
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
            e.columnName == 'essalud_anual' ||
            e.columnName == 'bonificacion_familiar' ||
            e.columnName == 'incremento'||
            e.columnName == 'basico_anual'||
            e.columnName == 'escolaridad'||
            e.columnName == 'gratificacion_julio'||
            e.columnName == 'gratificacion_diciembre'||
            e.columnName == 'gratificacion'||
            e.columnName == 'bonificacion_extraordinaria_julio'||
            e.columnName == 'bonificacion_extraordinaria_diciembre'||
            e.columnName == 'bonificacion_extraordinaria'||
            e.columnName == 'cts_mayo'||
            e.columnName == 'cts_noviembre' ||                        
            e.columnName == 'cts' ||                        
            e.columnName == 'total'
            ) {
          return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                right: 5,
              ),
              child: Text(
                NumberFormat("###,###,##0.00", 'en_US').format(e.value),
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
