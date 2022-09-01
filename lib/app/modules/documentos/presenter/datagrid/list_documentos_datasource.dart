import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../domain/documento_entity.dart';
import '../bloc/list/documentos_list_bloc.dart';
import 'new_documento_page.dart';

class ListDocumentosDataSource extends DataGridSource {
  ListDocumentosDataSource({
    required this.listadoDocumentos,
    required this.context,
    //required this.areas,
  }) {
    buildDataGridRows();
  }

  List<DocumentoEntity> listadoDocumentos = [];
  BuildContext context;
  List<DataGridRow> _documentosDataGridRows = [];
  final blocPrac = Modular.get<DocumentosListBloc>();

  @override
  List<DataGridRow> get rows => _documentosDataGridRows;

  void buildDataGridRows() {
    _documentosDataGridRows = listadoDocumentos
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'anio', value: dataGridRow.anio),
              DataGridCell<String>(
                  columnName: 'control', value: dataGridRow.control),
              DataGridCell<String>(
                  columnName: 'estado', value: dataGridRow.estado),
              DataGridCell<String>(columnName: 'tipo', value: dataGridRow.tipo),
              DataGridCell<String>(
                  columnName: 'expediente_pvn',
                  value: dataGridRow.expedientePvn),
              DataGridCell<String>(
                  columnName: 'numero_pvn', value: dataGridRow.numeroPvn),
              DataGridCell<String>(
                  columnName: 'remite', value: dataGridRow.remite),
              DataGridCell<String>(
                  columnName: 'asunto', value: dataGridRow.asunto),
              DataGridCell<String>(
                  columnName: 'destino', value: dataGridRow.destino),
              DataGridCell<String>(
                  columnName: 'fecha', value: dataGridRow.fecha),
              DataGridCell<String>(
                  columnName: 'expediente_mtc',
                  value: dataGridRow.expedienteMtc),
              DataGridCell<String>(
                  columnName: 'expediente_mef',
                  value: dataGridRow.expedienteMef),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
              DataGridCell<DocumentoEntity>(
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
    //final int rowIndex = effectiveRows.indexOf(row);
    final String estado =
        row.getCells().where((e) => e.columnName == 'estado').first.value;

    Color getRowBackgroundColor() {
      if (estado == 'ATENDIDO')
        return Colors.green[100]!;
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
        if (e.columnName == 'anio' ||
            e.columnName == 'asunto' ||
            e.columnName == 'detalle' ||
            e.columnName == 'remite' ||
            e.columnName == 'destino') {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 4,
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
        } else if (e.columnName == 'asunto' ||
            e.columnName == 'destino' ||
            e.columnName == 'remite' ||
            e.columnName == 'detalle') {
          return Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              right: 5,
            ),
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 10),
              maxLines: 3,
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

  _showModalDialog(_context, DocumentoEntity row) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 380,
                  height: 550,
                  child: NewDocumentoPage(
                    documentoEntity: row,
                  )));
        });
  }

  void updateDataGrid() {
    print('actualizando Documentos');
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
    final int dataRowIndex = _documentosDataGridRows.indexOf(dataGridRow);

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
          DocumentosId: listadoDocumentos[dataRowIndex].id,
          campo: column.columnName,
          valor: (newCellValue.toString()))); */

      //buildDataGridRows();
    }
    newCellValue = null;
  }
}
