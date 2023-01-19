import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../../core/domain/entities/area_entity.dart';
import '../../edit_confianza/edit_confianza_page.dart';
import '../../../domain/entities/confianza_entity.dart';
import 'package:collection/collection.dart';

class ConfianzaDataSource extends DataGridSource {
  BuildContext context;
  ConfianzaDataSource({
    required this.listadoConfianza,
    required this.context,
    required this.areas,
  });

  List<ConfianzaEntity> listadoConfianza;
  List<AreaEntity> areas;
  List<DataGridRow> _confianzaDataGridRows = [];

  @override
  List<DataGridRow> get rows => _confianzaDataGridRows;

  void buildDataGridRows() {
    _confianzaDataGridRows = listadoConfianza
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(                  columnName: 'anio', value: dataGridRow.anio),
              DataGridCell<String>(                  columnName: 'modalidad', value: dataGridRow.modalidad),
              DataGridCell<String>(columnName: 'tipo', value: dataGridRow.tipo),
              DataGridCell<String>(
                  columnName: 'plaza', value: dataGridRow.plaza),
              DataGridCell<String>(
                  columnName: 'estado', value: dataGridRow.estado),
              DataGridCell<String>(
                  columnName: 'desc_area', value: dataGridRow.descArea),
              DataGridCell<String>(
                  columnName: 'cargo', value: dataGridRow.cargo),
              DataGridCell<String>(columnName: 'dni', value: dataGridRow.dni),
              DataGridCell<String>(
                  columnName: 'nombres', value: dataGridRow.nombres),
              DataGridCell<String>(
                  columnName: 'inicio', value: dataGridRow.inicio),
              DataGridCell<String>(columnName: 'fin', value: dataGridRow.fin),
              DataGridCell<String>(
                  columnName: 'doc_designacion',
                  value: dataGridRow.docDesignacion),
              DataGridCell<String>(
                  columnName: 'doc_cese', value: dataGridRow.docCese),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
              DataGridCell<ConfianzaEntity>(
                  columnName: 'acciones', value: dataGridRow),
            ]))
        .toList();
    //_confianzaDataGridRows.add(DataGridRow(cells: [DataGridCell<String>(columnName: 'acciones', value: 'edit')]));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = _confianzaDataGridRows.indexOf(row);

    Color getRowBackgroundColor() {
      final String estado = row
          .getCells()
          .where((element) => element.columnName == 'estado')
          .first
          .value;

      final List<ConfianzaEntity> vigentes = this
          .listadoConfianza
          .where((element) => element.estado == 'VIGENTE')
          .toList();

      ConfianzaEntity? repetidos;
      repetidos = vigentes.firstWhereOrNull((element) =>
          element.id != this.listadoConfianza[rowIndex].id &&
          element.modalidad == this.listadoConfianza[rowIndex].modalidad &&
          element.plaza == this.listadoConfianza[rowIndex].plaza &&
          element.estado == this.listadoConfianza[rowIndex].estado);

      int idRepetido = repetidos == null ? 0 : repetidos.id;

      if (idRepetido > 0) {
        return Colors.red[400]!;
      } else if (estado == 'VIGENTE') {
        return Colors.green[100]!;
      } else
        return Colors.amber[200]!;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'acciones') {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8),
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.amber[800],
                size: 14,
              ),
              onPressed: () {
                _showModalDialog(this.context, e.value);
              },
            ),
          );
        }
        if (e.columnName == 'plaza' ||
            e.columnName == 'dni' ||
            e.columnName == 'modalidad') {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 10.5),
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
              style: TextStyle(fontSize: 10.5),
              overflow: TextOverflow.ellipsis,
            ),
          );
      }).toList(),
    );
  }

  _showModalDialog(_context, ConfianzaEntity row) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 380,
                  height: 550,
                  child: EditConfianzaPage(
                    confianzaEntity: row,
                  )));
        });
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
