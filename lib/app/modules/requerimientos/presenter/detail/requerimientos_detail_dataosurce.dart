import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/new/new_requerimiento_page.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../domain/requerimiento_detalle_entity.dart';
import '../../domain/requerimiento_entity.dart';

class RequerimientosDetailDataSource extends DataGridSource {
  RequerimientosDetailDataSource({
    required this.detalleRequerimiento,
  });

  List<RequerimientoDetalleEntity> detalleRequerimiento;
  List<DataGridRow> _confianzaDataGridRows = [];

  @override
  List<DataGridRow> get rows => _confianzaDataGridRows;

  void buildDataGridRows() {
    _confianzaDataGridRows = detalleRequerimiento
        .map((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'desc_fuente', value: dataGridRow.descFuente),
              DataGridCell<String>(
                  columnName: 'desc_meta', value: dataGridRow.descMeta),
              DataGridCell<String>(
                  columnName: 'desc_area', value: dataGridRow.descArea),
              DataGridCell<String>(
                  columnName: 'cargo', value: dataGridRow.cargo),
              DataGridCell<int>(
                  columnName: 'cantidad', value: dataGridRow.cantidad),
              DataGridCell<num>(columnName: 'monto', value: dataGridRow.monto),
              DataGridCell<RequerimientoDetalleEntity>(
                  columnName: 'acciones', value: dataGridRow),
            ]))
        .toList();
    //_confianzaDataGridRows.add(DataGridRow(cells: [DataGridCell<String>(columnName: 'acciones', value: 'edit')]));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = _confianzaDataGridRows.indexOf(row);

    return DataGridRowAdapter(
      //color: getRowBackgroundColor(),
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
                //_showModalDialog(this.context, e.value);
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

  _showModalDialog(_context, RequerimientoEntity row) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(width: 380, height: 550, child: Container()));
        });
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
