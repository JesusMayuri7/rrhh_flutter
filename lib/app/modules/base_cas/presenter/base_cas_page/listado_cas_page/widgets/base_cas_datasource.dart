import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../domain/entities/base_cas_entity.dart';

class BaseCasDataSource extends DataGridSource {
  BaseCasDataSource(this.basecasList) {
    //print(basecasList[0].nombres);
    buildDataGridRows();
  }

  void buildDataGridRows() {
    //print(basecasList[0].fuenteBase);
    _baseCasDataGridRows = basecasList
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'codigo_plaza', value: dataGridRow.codigoPlaza),
              DataGridCell<String>(
                  columnName: 'presupuesto', value: dataGridRow.presupuesto),
              DataGridCell<String>(
                  columnName: 'fuente_base', value: dataGridRow.fuenteBase),
              DataGridCell<String>(columnName: 'meta', value: dataGridRow.meta),
              DataGridCell<String>(
                  columnName: 'desc_unidad', value: dataGridRow.producto),
              DataGridCell<String>(
                  columnName: 'desc_area', value: dataGridRow.descArea),
              DataGridCell<String>(
                  columnName: 'cargo', value: dataGridRow.cargo),
              DataGridCell<String>(
                  columnName: 'estado_actual', value: dataGridRow.estadoActual),
              DataGridCell<String>(
                  columnName: 'estadoAir', value: dataGridRow.estadoAir),
              DataGridCell<String>(
                  columnName: 'sustento_legal',
                  value: dataGridRow.sustentoLegal),
              DataGridCell<String>(
                  columnName: 'convocatoria_nro',
                  value: dataGridRow.nroConvocatoria),
              DataGridCell<String>(
                  columnName: 'estado_convocatoria',
                  value: dataGridRow.estadoConvocatoria),
              DataGridCell<String>(
                  columnName: 'resultadoConvocatoria',
                  value: dataGridRow.resultadoConvocatoria),
              DataGridCell<String>(
                  columnName: 'fechaAlta', value: dataGridRow.fechaAlta),
              DataGridCell<String>(
                  columnName: 'fechaBaja', value: dataGridRow.fechaBaja),
              DataGridCell<String>(
                  columnName: 'modalidad', value: dataGridRow.modalidad),
              DataGridCell<int>(
                  columnName: 'mesInicio', value: dataGridRow.mesInicio),
              DataGridCell<int>(
                  columnName: 'mesFin', value: dataGridRow.mesFin),
              DataGridCell<double>(
                  columnName: 'monto', value: dataGridRow.monto),
              DataGridCell<double>(
                  columnName: 'essalud', value: dataGridRow.essalud),
              DataGridCell<double>(
                  columnName: 'montoAnual', value: dataGridRow.montoAnual),
              DataGridCell<double>(
                  columnName: 'essaludAnual', value: dataGridRow.essaludAnual),
              DataGridCell<double>(
                  columnName: 'aguinaldoAnual',
                  value: dataGridRow.aguinaldoAnual),
              DataGridCell<double>(
                  columnName: 'total', value: dataGridRow.total),
              DataGridCell<double>(
                  columnName: 'sctrSalud', value: dataGridRow.sctrSalud),
              DataGridCell<double>(
                  columnName: 'sctrSaludAnual',
                  value: dataGridRow.sctrSaludAnual),
              DataGridCell<double>(
                  columnName: 'sctrPension', value: dataGridRow.sctrPension),
              DataGridCell<double>(
                  columnName: 'sctrPensionAnual',
                  value: dataGridRow.sctrPensionAnual),
              DataGridCell<String>(
                  columnName: 'detalle', value: dataGridRow.detalle),
            ]))
        .toList();
  }

  List<BaseCasEntity> basecasList = [];

  //BuildContext context;

  List<DataGridRow> _baseCasDataGridRows = [];

  @override
  List<DataGridRow> get rows => _baseCasDataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final rowIndex = _baseCasDataGridRows.indexOf(row);
    var backgroundColor = Colors.white;
    if ((rowIndex % 2) == 0) {
      // backgroundColor = Theme.of(context).backgroundColor.withOpacity(0.7);
    }
    return DataGridRowAdapter(
        color: backgroundColor,
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName == 'monto' ||
              e.columnName == 'essalud' ||
              e.columnName == 'montoAnual' ||
              e.columnName == 'essaludAnual' ||
              e.columnName == 'aguinaldoAnual' ||
              e.columnName == 'total' ||
              e.columnName == 'sctrSalud' ||
              e.columnName == 'sctrSaludAnual' ||
              e.columnName == 'sctrPension' ||
              e.columnName == 'sctrPensionAnual') {
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
          }
          if (e.columnName == 'mesInicio' || e.columnName == 'mesFin') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                alignment: Alignment.center,
                child: Text(
                  e.value.toString(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 10),
                ));
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
