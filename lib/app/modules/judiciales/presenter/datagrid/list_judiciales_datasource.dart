import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../domain/judicial_entity.dart';
import '../bloc/list/judiciales_list_bloc.dart';
import 'new_judicial_page.dart';

class ListJudicialesDataSource extends DataGridSource {
  ListJudicialesDataSource({
    required this.listadoJudiciales,
    required this.context,
    //required this.areas,
  }) {
    buildDataGridRows();
  }

  List<JudicialEntity> listadoJudiciales = [];
  BuildContext context;
  List<DataGridRow> _judicialesDataGridRows = [];
  final blocPrac = Modular.get<JudicialesListBloc>();

  @override
  List<DataGridRow> get rows => _judicialesDataGridRows;

  void buildDataGridRows() {
    _judicialesDataGridRows = listadoJudiciales
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'anio', value: dataGridRow.anio),
              DataGridCell<String>(
                  columnName: 'presupuesto', value: dataGridRow.presupuesto),
              DataGridCell<String>(
                  columnName: 'desc_area', value: dataGridRow.descArea),
              DataGridCell<String>(columnName: 'dni', value: dataGridRow.dni),
              DataGridCell<String>(
                  columnName: 'nombres', value: dataGridRow.nombres),
              DataGridCell<num>(
                  columnName: 'monto_judicial',
                  value: dataGridRow.montoJudicial),
              DataGridCell<String>(
                  columnName: 'nro_cap', value: dataGridRow.nroCap),
              DataGridCell<String>(
                  columnName: 'codigo_plaza', value: dataGridRow.codigoPlaza),
              DataGridCell<String>(
                  columnName: 'fuente', value: dataGridRow.fuente),
              DataGridCell<String>(
                  columnName: 'finalidad', value: dataGridRow.finalidad),
              DataGridCell<String>(
                  columnName: 'fecha_ingreso', value: dataGridRow.fechaIngreso),
              DataGridCell<String>(
                  columnName: 'cargo', value: dataGridRow.cargo),
              DataGridCell<String>(
                  columnName: 'nro_expediente_judicial',
                  value: dataGridRow.nroExpedienteJudicial),
              DataGridCell<String>(
                  columnName: 'estado_procesal',
                  value: dataGridRow.estadoProcesal),
              DataGridCell<String>(
                  columnName: 'expediente_pvn',
                  value: dataGridRow.expedientePvn),
              DataGridCell<String>(
                  columnName: 'expediente_mtc',
                  value: dataGridRow.expedienteMtc),
              DataGridCell<String>(
                  columnName: 'expediente_mef',
                  value: dataGridRow.expedienteMef),
              DataGridCell<String>(
                  columnName: 'documento_orh', value: dataGridRow.documentoOrh),
              DataGridCell<String>(
                  columnName: 'observacion', value: dataGridRow.observacion),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
              DataGridCell<JudicialEntity>(
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
    final String estado =
        row.getCells().where((e) => e.columnName == 'presupuesto').first.value;

    Color getRowBackgroundColor() {
      if (estado == 'ACTIVO') return Color.fromARGB(255, 198, 243, 199);
      if (estado == 'TRAMITADO') return Color.fromARGB(255, 241, 237, 194);
      if (estado == 'PREVISTA') return Color.fromARGB(255, 178, 228, 231);
      if (estado == 'NO_PREVISTA')
        return Color.fromARGB(255, 228, 228, 228);
      else
        return Colors.transparent;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'acciones') {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 2.0),
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
                  onPressed: () {
                    _showModalDialog(context, e.value);
                  },
                ),
              ],
            ),
          );
        }
        if (e.columnName == 'anio' || e.columnName == 'detalle') {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 4,
            ),
            child: Text(
              textAlign: TextAlign.center,
              //overflow: TextOverflow.ellipsis,
              e.value.toString(),
              style: TextStyle(fontSize: 11),
            ),
          );
        } else if (e.columnName == 'monto_judicial' ||
            e.columnName == 'monto_planilla') {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
              alignment: Alignment.centerRight,
              child: Text(
                NumberFormat('#,##0.00', 'en_US').format(
                  e.value,
                ),
                style: TextStyle(fontSize: 11),
                //e.value.toString(),
                maxLines: 1,
              ));
        } else if (e.columnName == 'observacion' ||
            e.columnName == 'documento_orh' ||
            e.columnName == 'nro_expediente_judicial' ||
            e.columnName == 'nombres') {
          return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 5, left: 5),
              child: Text(
                e.value.toString(),
                style: TextStyle(fontSize: 11),
              )

              //style: TextStyle(fontSize: 11),
              //maxLines: 3,
              );
        } else
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              maxLines: 4,
              style: TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          );
      }).toList(),
    );
  }

  _showModalDialog(_contextJudicial, JudicialEntity row) {
    showDialog(
        context: _contextJudicial,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 500,
                  height: 700,
                  child: NewJudicialPage(
                    judicialEntity: row,
                    contextJudicial: _contextJudicial,
                  )));
        });
  }

  void updateDataGrid() {
    print('actualizando Judiciales');
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
    final int dataRowIndex = _judicialesDataGridRows.indexOf(dataGridRow);

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
/*       this.blocPrac.add(UpdatedPracEvent(
          JudicialesId: listadoJudiciales[dataRowIndex].id,
          campo: column.columnName,
          valor: (newCellValue.toString()))); */

      //buildDataGridRows();
    }
    newCellValue = null;
  }
}
