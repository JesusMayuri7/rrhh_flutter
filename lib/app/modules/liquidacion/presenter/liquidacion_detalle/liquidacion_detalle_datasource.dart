import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'bloc/liquidacion_detalle_bloc.dart';

class LiquidacionDetalleDataSource extends DataGridSource {
  List<LiquidacionDetalleEntity> listLiquidacionDetalle = [];
  List<DataGridRow> _liquidacionDetalleDataGridRows = [];
  var bloc = Modular.get<LiquidacionDetalleBloc>();

  LiquidacionDetalleDataSource(
      {required this.bloc, required this.listLiquidacionDetalle}) {
    buildDataGridRows();
  }

  @override
  List<DataGridRow> get rows => _liquidacionDetalleDataGridRows;

  void buildDataGridRows() {
    _liquidacionDetalleDataGridRows = listLiquidacionDetalle
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<String>(
                  columnName: 'clasificador', value: dataGridRow.clasificador),
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
                  columnName: 'monto_devolucion',
                  value: dataGridRow.montoDevolucion),
              DataGridCell<double>(
                  columnName: 'saldo',
                  value: dataGridRow.montoCertificado -
                      dataGridRow.montoDevengado),
            ]))
        .toList();
  }

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
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == 'clasificador') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
            alignment: Alignment.center,
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 12),
            ));
      } else if (e.columnName == 'id') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
            alignment: Alignment.center,
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 9),
            ));
      }
      return Container(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
          alignment: Alignment.centerRight,
          child: Text(
            NumberFormat('#,##0.00', 'en_US').format(
              double.parse(e.value.toString()),
            ),
            style: TextStyle(fontSize: 12),
            //e.value.toString(),
            maxLines: 1,
          ));
    }).toList());
  }

  // Edit
  dynamic newCellValue;

  TextEditingController editingController = TextEditingController();

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    this.bloc.add(SetFocusLiquidacionDetalleEvent(excludeFocus: false));
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    if (column.columnName == 'monto_certificado' ||
        column.columnName == 'monto_liquidacion' ||
        column.columnName == 'monto_devengado' ||
        column.columnName == 'monto_devolucion') {
      return _buildTextFieldWidget(displayText, column, submitCell);
    }
    return null;
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column) async {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value ??
        '';

    final int dataRowIndex =
        _liquidacionDetalleDataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    if (column.columnName == 'monto_certificado' ||
        column.columnName == 'monto_liquidacion' ||
        column.columnName == 'monto_devengado' ||
        column.columnName == 'monto_devolucion') {
      /*
      _liquidacionDetalleDataGridRows[dataRowIndex]
              .getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(
              columnName: 'monto_certificado', value: newCellValue);

*/

      this.bloc.add(UpdatedLiquidacionDetalleEvent(
          liquidacionDetalle: listLiquidacionDetalle,
          liquidacionDetalleId: listLiquidacionDetalle[dataRowIndex].id,
          dscMonto: column.columnName,
          monto: newCellValue));
      //listLiquidacionDetalle[dataRowIndex].copyWith(montoCertificado: newCellValue as double);

      buildDataGridRows();
    }
    newCellValue = null;
  }

  RegExp _getRegExp(bool isNumericKeyBoard, String columnName) {
    return isNumericKeyBoard
        ? (columnName == 'monto_certificado' ||
                columnName == 'monto_liquidacion' ||
                columnName == 'monto_devengado' ||
                columnName == 'monto_devolucion')
            ? RegExp('[0-9.]')
            : RegExp('[0-9]')
        : RegExp('[a-zA-Z ]');
  }

  Widget _buildTextFieldWidget(
      String displayText, GridColumn column, CellSubmit submitCell) {
    bool isTextAlignRight = false;

    final bool isNumericKeyBoardType =
        column.columnName == 'monto_certificado' ||
            column.columnName == 'monto_liquidacion' ||
            column.columnName == 'monto_devengado' ||
            column.columnName == 'monto_devolucion';

    // Holds regular expression pattern based on the column type.
    final RegExp regExp = _getRegExp(isNumericKeyBoardType, column.columnName);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
      alignment: isTextAlignRight == true
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: TextField(
        style: TextStyle(fontSize: 12),
        textAlignVertical: TextAlignVertical.center,
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isTextAlignRight == true ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        // maxLines: 1,

        //keyboardAppearance: sampleModel.themeData.brightness,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
        ),
        // style: textStyle,
        //  cursorColor: sampleModel.backgroundColor,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(regExp)
        ],
        keyboardType:
            isNumericKeyBoardType ? TextInputType.number : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericKeyBoardType) {
              newCellValue = column.columnName == 'monto_certificado' ||
                      column.columnName == 'monto_liquidacion' ||
                      column.columnName == 'monto_devengado' ||
                      column.columnName == 'monto_devolucion'
                  ? double.parse(value)
                  : int.parse(value);
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          /// Call [CellSubmit] callback to fire the canSubmitCell and
          /// onCellSubmit to commit the new value in single place.
          submitCell();
        },
      ),
    );
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
