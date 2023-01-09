import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/alta_baja/alta_baja_prac_page.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/bloc/list_prac_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ListPracticanteDataSource extends DataGridSource {
  ListPracticanteDataSource({
    required this.listadoPracticante,
    required this.context,
    //required this.areas,
  }) {
    buildDataGridRows();
  }

  List<PracticanteEntity> listadoPracticante = [];
  BuildContext context;
  List<DataGridRow> _practicanteDataGridRows = [];
  final blocPrac = Modular.get<ListPracBloc>();

  @override
  List<DataGridRow> get rows => _practicanteDataGridRows;

  void buildDataGridRows() {
    _practicanteDataGridRows = listadoPracticante
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'anio', value: dataGridRow.anio),
              DataGridCell<String>(
                  columnName: 'codigo_plaza', value: dataGridRow.codigoPlaza),
              DataGridCell<String>(
                  columnName: 'plaza', value: dataGridRow.plaza),
              DataGridCell<String>(
                  columnName: 'fuente_base', value: dataGridRow.fuenteBase),
              DataGridCell<String>(columnName: 'sede', value: dataGridRow.sede),
              DataGridCell<String>(columnName: 'meta', value: dataGridRow.meta),
              DataGridCell<String>(
                  columnName: 'finalidad', value: dataGridRow.finalidad),
              DataGridCell<String>(
                  columnName: 'desc_unidad', value: dataGridRow.descUnidad),
              DataGridCell<String>(
                  columnName: 'desc_area', value: dataGridRow.descArea),
              DataGridCell<String>(
                  columnName: 'cargo', value: dataGridRow.cargo),
              DataGridCell<String>(columnName: 'dni', value: dataGridRow.dni),
              DataGridCell<String>(
                  columnName: 'nombres', value: dataGridRow.nombres),
              DataGridCell<num>(
                  columnName: 'monto_base', value: dataGridRow.montoBase),
              DataGridCell<String>(columnName: 'tipo', value: dataGridRow.tipo),
              DataGridCell<String>(
                  columnName: 'estado', value: dataGridRow.estado),
              DataGridCell<String>(
                  columnName: 'estado_actual', value: dataGridRow.estadoActual),
              DataGridCell<String>(
                  columnName: 'fecha_alta', value: dataGridRow.fechaAlta),
              DataGridCell<String>(
                  columnName: 'fecha_baja', value: dataGridRow.fechaBaja),
              DataGridCell<String>(
                  columnName: 'tramite', value: dataGridRow.tramite),
              DataGridCell<String>(
                  columnName: 'nro_tramite', value: dataGridRow.nroTramite),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
              DataGridCell<String>(
                  columnName: 'fuente_air', value: dataGridRow.fuenteAir),
              DataGridCell<String>(
                  columnName: 'estado_pap', value: dataGridRow.estadoPap),
              DataGridCell<String>(
                  columnName: 'estado_opp', value: dataGridRow.estadoOpp),
              DataGridCell<String>(
                  columnName: 'estados', value: dataGridRow.estados),
              DataGridCell<String>(
                  columnName: 'estado_air', value: dataGridRow.estadoAir),
              DataGridCell<String>(
                  columnName: 'modalidd', value: dataGridRow.modalidad),
              DataGridCell<PracticanteEntity>(
                  columnName: 'acciones', value: dataGridRow),
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
      padding: EdgeInsets.all(0.0),
      child: Text(summaryValue),
    );
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
        if (e.columnName == 'acciones') {
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Editar',
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colors.blue[800],
                    size: 12,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: 'Baja y Alta',
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.red[800],
                    size: 12,
                  ),
                  onPressed: () {
                    _showModalDialog(this.context, e.value);
                  },
                ),
              ],
            ),
          );
        }
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
              style: TextStyle(fontSize: 10),
            ),
          );
        } else if (e.columnName == 'monto_base') {
          return Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              right: 5,
            ),
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 10),
            ),
          );
        } else
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          );
      }).toList(),
    );
  }

  _showModalDialog(_context, PracticanteEntity row) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 380,
                  height: 550,
                  child: AltaBajaPracPage(
                    practicanteEntity: row,
                  )));
        });
  }

  void updateDataGrid() {
    notifyListeners();
  }

  // EDIT
  dynamic newCellValue;

  TextEditingController editingController = TextEditingController();

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';
    newCellValue = null;
    if (column.columnName == 'codigo_plaza' ||
        column.columnName == 'dni' ||
        column.columnName == 'nombres' ||
        column.columnName == 'fecha_alta' ||
        column.columnName == 'fecha_baja' ||
        column.columnName == 'tramite' ||
        column.columnName == 'nro_tramite' ||
        column.columnName == 'detalle') {
      return _buildTextFieldWidget(displayText, column, submitCell);
    }
    return null;
  }

  Widget _buildTextFieldWidget(
      String _displayText, GridColumn column, CellSubmit submitCell) {
    final bool isTextAlignRight = column.columnName == 'codigo_plaza';

    final bool isNumericKeyBoardType = column.columnName == 'fuente';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
      alignment:
          isTextAlignRight ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        style: TextStyle(fontSize: 10, color: Colors.black),
        textAlignVertical: TextAlignVertical.center,
        autofocus: true,
        controller: editingController..text = _displayText,
        textAlign: isTextAlignRight ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(2, 0, 2, 17.0),
        ),
        keyboardType:
            isNumericKeyBoardType ? TextInputType.number : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericKeyBoardType) {
              newCellValue = column.columnName == 'fuente' ? (value) : (value);
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          submitCell();
        },
      ),
    );
  }

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value ??
        '';
    final int dataRowIndex = _practicanteDataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    if (column.columnName == 'codigo_plaza' ||
        column.columnName == 'dni' ||
        column.columnName == 'nombres' ||
        column.columnName == 'fecha_alta' ||
        column.columnName == 'fecha_baja' ||
        column.columnName == 'fuente_devengado_id' ||
        column.columnName == 'detalle') {
      this.blocPrac.add(UpdatedPracEvent(
          practicanteId: listadoPracticante[dataRowIndex].id,
          campo: column.columnName,
          valor: (newCellValue.toString())));

      //buildDataGridRows();
    }
    newCellValue = null;
  }
}
