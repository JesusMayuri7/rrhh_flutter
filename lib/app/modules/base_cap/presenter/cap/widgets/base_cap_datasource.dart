import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/base_cap_entity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BaseCapDataSource extends DataGridSource {
  BaseCapDataSource(this.basecapList) {
    //print(basecasList[0].nombres);
    buildDataGridRows();
  }

  void buildDataGridRows() {
    //print(basecasList[0].fuenteBase);
    _baseCapDataGridRows = basecapList
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell(
                  columnName: 'codigo_plaza', value: dataGridRow.codigoPlaza),
              DataGridCell(columnName: 'plaza', value: dataGridRow.plaza),
              DataGridCell(
                  columnName: 'plaza_old', value: dataGridRow.plazaOld),
              DataGridCell(
                  columnName: 'fuente_base', value: dataGridRow.fuenteBase),
              DataGridCell(columnName: 'producto', value: dataGridRow.producto),
              DataGridCell(columnName: 'sede', value: dataGridRow.sede),
              DataGridCell(
                  columnName: 'desc_area', value: dataGridRow.descArea),
              DataGridCell(columnName: 'meta', value: dataGridRow.meta),
              DataGridCell(
                  columnName: 'finalidad', value: dataGridRow.finalidad),
              DataGridCell(columnName: 'cargocap', value: dataGridRow.cargocap),
              DataGridCell(
                  columnName: 'cargo_pap', value: dataGridRow.cargoPap),
              DataGridCell(
                  columnName: 'estado_opp', value: dataGridRow.estadoOpp),
              DataGridCell(
                  columnName: 'estado_pap', value: dataGridRow.estadoPap),
              DataGridCell(
                  columnName: 'estado_air', value: dataGridRow.estadoAir),
              DataGridCell(
                  columnName: 'estado_actual', value: dataGridRow.estadoActual),
              DataGridCell(columnName: 'dni', value: dataGridRow.dni),
              DataGridCell(columnName: 'nombres', value: dataGridRow.nombres),
              DataGridCell(
                  columnName: 'tipo_ingreso', value: dataGridRow.tipoIngreso),
              DataGridCell(
                  columnName: 'fe_ingreso', value: dataGridRow.feIngreso),
              DataGridCell(
                  columnName: 'tipo_salida', value: dataGridRow.tipoSalida),
              DataGridCell(
                  columnName: 'fe_salida', value: dataGridRow.feSalida),
              DataGridCell(
                  columnName: 'fin_licencia', value: dataGridRow.finLicencia),
              DataGridCell(
                  columnName: 'modalidad', value: dataGridRow.modalidad),
              DataGridCell(columnName: 'uniforme', value: dataGridRow.uniforme),
              DataGridCell(columnName: 'vale', value: dataGridRow.vale),
              DataGridCell(columnName: 'fe_nac', value: dataGridRow.feNac),
              DataGridCell(columnName: 'nivelO', value: dataGridRow.nivelO),
              DataGridCell(
                  columnName: 'desc_nivel', value: dataGridRow.descNivel),
              DataGridCell(
                  columnName: 'desc_escala', value: dataGridRow.descEscala),
              DataGridCell(
                  columnName: 'ppto_2021', value: dataGridRow.ppto2021),
              DataGridCell(
                  columnName: 'eps_aporta', value: dataGridRow.epsAporta),
              DataGridCell(
                  columnName: 'monto_air', value: dataGridRow.montoBasico),
              DataGridCell(
                  columnName: 'monto_escala', value: dataGridRow.montoEscala),
              DataGridCell(columnName: 'asig_fam', value: dataGridRow.asigFam),
              DataGridCell(
                  columnName: 'total_basico', value: dataGridRow.totalBasico),
              DataGridCell(columnName: 'essalud', value: dataGridRow.essalud),
              DataGridCell(
                  columnName: 'sctr_salud', value: dataGridRow.sctrSalud),
              DataGridCell(
                  columnName: 'sctr_salud_grati',
                  value: dataGridRow.sctrSaludGrati),
              DataGridCell(columnName: 'vida_ley', value: dataGridRow.vidaLey),
              DataGridCell(
                  columnName: 'sctr_pension', value: dataGridRow.sctrPension),
              DataGridCell(
                  columnName: 'sctr_pension_grati',
                  value: dataGridRow.sctrPensionGrati),
              DataGridCell(
                  columnName: "ene_monto", value: dataGridRow.eneMonto),
              DataGridCell(
                  columnName: "ene_essalud", value: dataGridRow.eneEssalud),
              DataGridCell(
                  columnName: "ene_sctr_salud",
                  value: dataGridRow.eneSctrSalud),
              DataGridCell(
                  columnName: "ene_vidaley", value: dataGridRow.eneVidaley),
              DataGridCell(
                  columnName: "ene_sctr_pension",
                  value: dataGridRow.eneSctrPension),
              DataGridCell(
                  columnName: "ene_escolaridad",
                  value: dataGridRow.eneEscolaridad),
              DataGridCell(
                  columnName: "feb_monto", value: dataGridRow.febMonto),
              DataGridCell(
                  columnName: "feb_essalud", value: dataGridRow.febEssalud),
              DataGridCell(
                  columnName: "feb_sctr_salud",
                  value: dataGridRow.febSctrSalud),
              DataGridCell(
                  columnName: "feb_vidaley", value: dataGridRow.febVidaley),
              DataGridCell(
                  columnName: "feb_sctr_pension",
                  value: dataGridRow.abrSctrPension),
              DataGridCell(
                  columnName: "mar_monto", value: dataGridRow.marMonto),
              DataGridCell(
                  columnName: "mar_essalud", value: dataGridRow.marEssalud),
              DataGridCell(
                  columnName: "mar_sctr_salud",
                  value: dataGridRow.marSctrSalud),
              DataGridCell(
                  columnName: "mar_vidaley", value: dataGridRow.marVidaley),
              DataGridCell(
                  columnName: "mar_sctr_pension",
                  value: dataGridRow.marSctrPension),
              DataGridCell(
                  columnName: "abr_monto", value: dataGridRow.abrMonto),
              DataGridCell(
                  columnName: "abr_essalud", value: dataGridRow.abrEssalud),
              DataGridCell(
                  columnName: "abr_sctr_salud",
                  value: dataGridRow.abrSctrSalud),
              DataGridCell(
                  columnName: "abr_vidaley", value: dataGridRow.abrVidaley),
              DataGridCell(
                  columnName: "abr_sctr_pension",
                  value: dataGridRow.abrSctrPension),
              DataGridCell(
                  columnName: "may_monto", value: dataGridRow.mayMonto),
              DataGridCell(
                  columnName: "may_essalud", value: dataGridRow.mayEssalud),
              DataGridCell(
                  columnName: "may_sctr_salud",
                  value: dataGridRow.maySctrSalud),
              DataGridCell(
                  columnName: "may_vidaley", value: dataGridRow.mayVidaley),
              DataGridCell(
                  columnName: "may_sctr_pension",
                  value: dataGridRow.maySctrPension),
              DataGridCell(columnName: "may_cts", value: dataGridRow.mayCts),
              DataGridCell(
                  columnName: "jun_monto", value: dataGridRow.junMonto),
              DataGridCell(
                  columnName: "jun_essalud", value: dataGridRow.junEssalud),
              DataGridCell(
                  columnName: "jun_sctr_salud",
                  value: dataGridRow.junSctrSalud),
              DataGridCell(
                  columnName: "jun_vidaley", value: dataGridRow.junVidaley),
              DataGridCell(
                  columnName: "jun_sctr_pension",
                  value: dataGridRow.junSctrPension),
              DataGridCell(
                  columnName: "jul_monto", value: dataGridRow.julMonto),
              DataGridCell(
                  columnName: "jul_essalud", value: dataGridRow.julEssalud),
              DataGridCell(
                  columnName: "jul_sctr_salud",
                  value: dataGridRow.julSctrSalud),
              DataGridCell(
                  columnName: "jul_vidaley", value: dataGridRow.julVidaley),
              DataGridCell(
                  columnName: "jul_sctr_pension_grati",
                  value: dataGridRow.julSctrPensionGrati),
              DataGridCell(
                  columnName: "jul_grati", value: dataGridRow.julGrati),
              DataGridCell(columnName: "jul_boni", value: dataGridRow.julBoni),
              DataGridCell(
                  columnName: "ago_monto", value: dataGridRow.agoMonto),
              DataGridCell(
                  columnName: "ago_essalud", value: dataGridRow.agoEssalud),
              DataGridCell(
                  columnName: "ago_sctr_salud",
                  value: dataGridRow.agoSctrSalud),
              DataGridCell(
                  columnName: "ago_vidaley", value: dataGridRow.agoVidaley),
              DataGridCell(
                  columnName: "ago_sctr_pension",
                  value: dataGridRow.agoSctrPension),
              DataGridCell(
                  columnName: "set_monto", value: dataGridRow.setMonto),
              DataGridCell(
                  columnName: "set_essalud", value: dataGridRow.setEssalud),
              DataGridCell(
                  columnName: "set_sctr_salud",
                  value: dataGridRow.setSctrSalud),
              DataGridCell(
                  columnName: "set_vidaley", value: dataGridRow.setVidaley),
              DataGridCell(
                  columnName: "set_sctr_pension",
                  value: dataGridRow.setSctrPension),
              DataGridCell(
                  columnName: "oct_monto", value: dataGridRow.octMonto),
              DataGridCell(
                  columnName: "oct_essalud", value: dataGridRow.octEssalud),
              DataGridCell(
                  columnName: "oct_sctr_salud",
                  value: dataGridRow.octSctrSalud),
              DataGridCell(
                  columnName: "oct_vidaley", value: dataGridRow.octVidaley),
              DataGridCell(
                  columnName: "oct_sctr_pension",
                  value: dataGridRow.octSctrPension),
              DataGridCell(
                  columnName: "nov_monto", value: dataGridRow.novMonto),
              DataGridCell(
                  columnName: "nov_essalud", value: dataGridRow.novEssalud),
              DataGridCell(
                  columnName: "nov_sctr_salud",
                  value: dataGridRow.novSctrSalud),
              DataGridCell(
                  columnName: "nov_vidaley", value: dataGridRow.novVidaley),
              DataGridCell(
                  columnName: "nov_sctr_pension",
                  value: dataGridRow.novSctrPension),
              DataGridCell(columnName: "nov_cts", value: dataGridRow.novCts),
              DataGridCell(
                  columnName: "dic_monto", value: dataGridRow.dicMonto),
              DataGridCell(
                  columnName: "dic_essalud", value: dataGridRow.dicEssalud),
              DataGridCell(
                  columnName: "dic_sctr_salud",
                  value: dataGridRow.dicSctrSalud),
              DataGridCell(
                  columnName: "dic_vidaley", value: dataGridRow.dicVidaley),
              DataGridCell(
                  columnName: "dic_sctr_pension_grati",
                  value: dataGridRow.dicSctrPensionGrati),
              DataGridCell(columnName: "dic_boni", value: dataGridRow.dicBoni),
              DataGridCell(
                  columnName: "dic_grati", value: dataGridRow.dicGrati),
            ]))
        .toList();
  }

  List<BaseCapEntity> basecapList = [];

  //BuildContext context;

  List<DataGridRow> _baseCapDataGridRows = [];

  @override
  List<DataGridRow> get rows => _baseCapDataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final rowIndex = _baseCapDataGridRows.indexOf(row);
    var backgroundColor = Colors.white;
    if ((rowIndex % 2) == 0) {
      // backgroundColor = Theme.of(context).backgroundColor.withOpacity(0.7);
    }
    return DataGridRowAdapter(
        color: backgroundColor,
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName.contains('ene') ||
              e.columnName.contains('feb') ||
              e.columnName.contains('mar') ||
              e.columnName.contains('abr') ||
              e.columnName.contains('may') ||
              e.columnName.contains('jun') ||
              e.columnName.contains('jul') ||
              e.columnName.contains('ago') ||
              e.columnName.contains('set') ||
              e.columnName.contains('oct') ||
              e.columnName.contains('nov') ||
              e.columnName.contains('dic') ||
              e.columnName.contains('monto_escala') ||
              e.columnName.contains('monto_air') ||
              e.columnName.contains('asig_fam') ||
              e.columnName.contains('uniforme') ||
              e.columnName.contains('vale')) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              alignment: Alignment.centerRight,
              child: Text(
                NumberFormat('#,##0.00', 'en_US')
                    .format(double.parse(e.value.toString())),
                style: TextStyle(fontSize: 10.5),
              ),
            );
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
    print('actualizando grid');
    notifyListeners();
  }
}
