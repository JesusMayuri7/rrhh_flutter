import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/liquidacion/bloc/liquidacion_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/list_liquidacion/bloc/liquidacion_list_bloc.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:collection/collection.dart';

class LiquidacionDataSource extends DataGridSource {
  List<LiquidacionEntity> listLiquidacionFiltered = [];
  List<DataGridRow> _liquidacionDataGridRows = [];

  final blocLiquidacion = Modular.get<LiquidacionBloc>();
  final blocLiquidacionList = Modular.get<LiquidacionListBloc>();
  final List<String> procesos = [
    'PENDIENTE',
    'SOLICITUD_VALIDADA',
    'ENVIADO_OTC',
    'CON_EXPEDIENTE',
    'CERTIFICADO_VALIDADO',
    'ENVIADO_GBEL'
  ];

  LiquidacionDataSource({
    required this.listLiquidacionFiltered,
  }) {
    buildDataGridRows();
  }

  @override
  List<DataGridRow> get rows => _liquidacionDataGridRows;

  void buildDataGridRows() {
    _liquidacionDataGridRows = listLiquidacionFiltered
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<String>(columnName: 'anio', value: dataGridRow.anio),
              DataGridCell<String>(
                  columnName: 'dsc_modalidad', value: dataGridRow.dscModalidad),
              DataGridCell<int>(
                  columnName: 'certificado_id',
                  value: dataGridRow.certificadoId),
              DataGridCell<String>(
                  columnName: 'dsc_certificado',
                  value: dataGridRow.dscCertificado),
              DataGridCell<int>(
                  columnName: 'fuente_id', value: dataGridRow.fuenteId),
              DataGridCell<int>(
                  columnName: 'idmeta_anual', value: dataGridRow.metaId),
              DataGridCell<String>(
                  columnName: 'finalidad', value: dataGridRow.finalidad),
              DataGridCell<String>(columnName: 'dni', value: dataGridRow.dni),
              DataGridCell<String>(
                  columnName: 'nombres', value: dataGridRow.nombres),
              DataGridCell<String>(
                  columnName: 'expediente', value: dataGridRow.expediente),
              DataGridCell<String>(
                  columnName: 'fecha_expediente',
                  value: dataGridRow.fechaExpediente),
              DataGridCell<List<LiquidacionDetalleEntity>>(
                  columnName: 'liquidacion_detalle',
                  value: dataGridRow.liquidacionDetalle),
              DataGridCell<int>(
                  columnName: 'certificado_devengado_id',
                  value: dataGridRow.certificadoDevengadoId),
              DataGridCell<String>(
                  columnName: 'dsc_certificado_devengado',
                  value: dataGridRow.dscCertificadoDevengado),
              DataGridCell<int>(
                  columnName: 'fuente_devengado_id',
                  value: dataGridRow.fuenteDevengadoId),
              DataGridCell<int>(
                  columnName: 'meta_devengado_id',
                  value: dataGridRow.metaDevengadoId),
              DataGridCell<String>(
                  columnName: 'finalidad_devengado',
                  value: dataGridRow.finalidadDevengado),
              DataGridCell<String>(
                  columnName: 'codigo_plaza', value: dataGridRow.codigoPlaza),
              DataGridCell<String>(
                  columnName: 'codigo_siga', value: dataGridRow.codigoSiga),
              DataGridCell<String>(
                  columnName: 'proceso', value: dataGridRow.proceso),
              DataGridCell<String>(
                  columnName: 'actualizado', value: dataGridRow.actualizado),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // Set row color is diferent Certificado, Fuente y Meta
    Color getRowBackgroundColor() {
      final int certificadoId = row.getCells()[3].value;
      final int certificadoDevengadoId = row.getCells()[13].value;

      final int fuenteId = row.getCells()[5].value;
      final int fuenteDevengadoId = row.getCells()[15].value;

      final int metaId = row.getCells()[6].value;
      final int metaDevengadoId = row.getCells()[16].value;

      final String expediente = row.getCells()[10].value;

      if (certificadoId == 0) {
        return Colors.blue[200]!;
      } else if ((fuenteId != fuenteDevengadoId ||
              certificadoId != certificadoDevengadoId ||
              metaId != metaDevengadoId) &&
          (certificadoDevengadoId > 0)) {
        return Colors.red[300]!;
      } else if (expediente.isEmpty)
        return Colors.amber[300]!;
      else
        return Colors.transparent;
    }

    return DataGridRowAdapter(
        color: getRowBackgroundColor(),
        cells: row.getCells().map<Widget>((e) {
          if (e.columnName == 'finalidad' ||
              e.columnName == 'finalidad_devengado' ||
              e.columnName == 'nombres' ||
              e.columnName == 'dsc_certificado' ||
              e.columnName == 'dsc_certificado_devengado') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.centerLeft,
                child: Text(
                  e.value.toString(),
                  style: TextStyle(fontSize: 10),
                ));
          } else
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.center,
                child: Text(
                  e.value.toString(),
                  style: TextStyle(fontSize: 10),
                ));
        }).toList());
  }

  // Edit
  dynamic newCellValue;

  TextEditingController editingController = TextEditingController();

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';
    newCellValue = null;

    print('display ' + displayText);

    if (column.columnName == 'dsc_certificado') {
      CertificadoEntity? selectedCertificado = displayText.isEmpty
          ? null
          : (this.blocLiquidacion.state as LiquidacionLoadedState)
              .certificados
              .where((element) =>
                  element.id ==
                  dataGridRow
                      .getCells()
                      .where(
                          (element) => element.columnName == 'certificado_id')
                      .first
                      .value)
              .first;
      return _buildDropDownCertificado(selectedCertificado, submitCell,
          (this.blocLiquidacion.state as LiquidacionLoadedState).certificados);
    }

    if (column.columnName == 'dsc_certificado_devengado') {
      CertificadoEntity? selectedCertificado = displayText.isEmpty
          ? null
          : (this.blocLiquidacion.state as LiquidacionLoadedState)
              .certificados
              .where((element) =>
                  element.id ==
                  dataGridRow
                      .getCells()
                      .where((element) =>
                          element.columnName == 'certificado_devengado_id')
                      .first
                      .value)
              .first;
      return _buildDropDownCertificado(selectedCertificado, submitCell,
          (this.blocLiquidacion.state as LiquidacionLoadedState).certificados);
    }

    if (column.columnName == 'finalidad') {
      MetaEntity? selectedMeta = displayText.isEmpty
          ? null
          : (this.blocLiquidacion.state as LiquidacionLoadedState)
              .metas
              .where((element) =>
                  element.idmetaAnual ==
                  dataGridRow
                      .getCells()
                      .where((element) => element.columnName == 'idmeta_anual')
                      .first
                      .value)
              .first;
      return _buildDropDownMetas(selectedMeta, submitCell,
          (this.blocLiquidacion.state as LiquidacionLoadedState).metas);
    }

    if (column.columnName == 'finalidad_devengado') {
      MetaEntity? selectedMeta = displayText.isEmpty
          ? null
          : (this.blocLiquidacion.state as LiquidacionLoadedState)
              .metas
              .where((element) =>
                  element.idmetaAnual ==
                  dataGridRow
                      .getCells()
                      .where((element) =>
                          element.columnName == 'meta_devengado_id')
                      .first
                      .value)
              .first;
      return _buildDropDownMetas(selectedMeta, submitCell,
          (this.blocLiquidacion.state as LiquidacionLoadedState).metas);
    }

    if (column.columnName == 'proceso') {
      String? selectedProceso = displayText.isEmpty
          ? null
          : procesos
              .where((element) =>
                  element ==
                  dataGridRow
                      .getCells()
                      .where((element) => element.columnName == 'proceso')
                      .first
                      .value)
              .first;
      return _buildDropDownProceso(selectedProceso, submitCell, procesos);
    }

    if (column.columnName == 'codigo_plaza' ||
        column.columnName == 'dni' ||
        column.columnName == 'nombres' ||
        column.columnName == 'expediente' ||
        column.columnName == 'fecha_expediente' ||
        column.columnName == 'fuente_devengado_id' ||
        column.columnName == 'codigo_siga') {
      print('antes de build ' + displayText);
      return _buildTextFieldWidget(displayText, column, submitCell);
    }
    return null;
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
    final int dataRowIndex = _liquidacionDataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    if (column.columnName == 'dsc_certificado') {
      print('newCellvalue ' + newCellValue.toString());

      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: listLiquidacionFiltered,
          liquidacionId: listLiquidacionFiltered[dataRowIndex].id,
          campo: 'certificado_id',
          valor: (newCellValue as CertificadoEntity).id));

      //buildDataGridRows();
    }

    if (column.columnName == 'dsc_certificado_devengado') {
      print('newCellvalue ' + newCellValue.toString());

      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: listLiquidacionFiltered,
          liquidacionId: listLiquidacionFiltered[dataRowIndex].id,
          campo: 'certificado_devengado_id',
          valor: (newCellValue as CertificadoEntity).id));
    }
    if (column.columnName == 'finalidad') {
      print('newCellvalue ' + newCellValue.toString());

      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: listLiquidacionFiltered,
          liquidacionId: listLiquidacionFiltered[dataRowIndex].id,
          campo: 'meta_id',
          valor: (newCellValue as MetaEntity).idmetaAnual));
    }

    if (column.columnName == 'finalidad_devengado') {
      print('newCellvalue ' + newCellValue.toString());

      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: listLiquidacionFiltered,
          liquidacionId: listLiquidacionFiltered[dataRowIndex].id,
          campo: 'meta_devengado_id',
          valor: (newCellValue as MetaEntity).idmetaAnual));
    }

    if (column.columnName == 'proceso') {
      log('proceso ' + newCellValue.toString());

      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: listLiquidacionFiltered,
          liquidacionId: listLiquidacionFiltered[dataRowIndex].id,
          campo: 'proceso',
          valor: (newCellValue as String)));
    }

    if (column.columnName == 'codigo_plaza' ||
        column.columnName == 'dni' ||
        column.columnName == 'nombres' ||
        column.columnName == 'expediente' ||
        column.columnName == 'fecha_expediente' ||
        column.columnName == 'fuente_devengado_id' ||
        column.columnName == 'codigo_siga') {
      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: listLiquidacionFiltered,
          liquidacionId: listLiquidacionFiltered[dataRowIndex].id,
          campo: column.columnName,
          valor: (newCellValue.toString())));

      //buildDataGridRows();
    }
    newCellValue = null;
  }

  RegExp _getRegExp(bool isNumericKeyBoard, String columnName) {
    return isNumericKeyBoard
        ? columnName == 'fuente' || columnName == 'fuente_devengado_id'
            ? RegExp('[0-9.]')
            : RegExp('[0-9]')
        : RegExp('[a-zA-Z0-9-/]');
  }

  Widget _buildTextFieldWidget(
      String _displayText, GridColumn column, CellSubmit submitCell) {
    final bool isTextAlignRight = column.columnName == 'codigo_plaza' ||
        column.columnName == 'dni' ||
        column.columnName == 'nombres' ||
        column.columnName == 'expediente' ||
        column.columnName == 'codigo_siga';

    final bool isNumericKeyBoardType = column.columnName == 'fuente' ||
        column.columnName == 'fuente_devengado_id';

    // Holds regular expression pattern based on the column type.
    final RegExp regExp = _getRegExp(isNumericKeyBoardType, column.columnName);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
      alignment:
          isTextAlignRight ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        style: TextStyle(fontSize: 12),
        textAlignVertical: TextAlignVertical.center,
        autofocus: true,
        controller: editingController..text = _displayText,
        textAlign: isTextAlignRight ? TextAlign.right : TextAlign.left,
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
              newCellValue = column.columnName == 'fuente' ||
                      column.columnName == 'fuente_devengado_id'
                  ? (value)
                  : (value);
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

  /// Building a [DropDown] for combo box column.

  Widget _buildDropDownCertificado(CertificadoEntity? _certificado,
      CellSubmit submitCell, List<CertificadoEntity> dropDownMenuItems) {
    if (_certificado == null)
      print('vacio');
    else
      print('selected ' + _certificado.toString());
    return Container(
      //alignedDropdown: true,
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.centerLeft,
      child: DropdownButton<CertificadoEntity>(
          value: _certificado,
          autofocus: true,
          focusColor: Colors.transparent,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          isExpanded: true,
          //style: textStyle,
          onChanged: (CertificadoEntity? value) {
            print('onChanged 1' + newCellValue.toString());
            newCellValue = value;
            print('onChanged 2' + value.toString());
            submitCell();
            print('onChanged 3' + newCellValue.toString());
            submitCell();
          },
          items: dropDownMenuItems.map<DropdownMenuItem<CertificadoEntity>>(
              (CertificadoEntity value) {
            return DropdownMenuItem<CertificadoEntity>(
              value: value,
              child: Text(
                value.dscCertificado,
                style: TextStyle(fontSize: 10.0),
              ),
            );
          }).toList()),
    );
  }

  Widget _buildDropDownMetas(MetaEntity? _meta, CellSubmit submitCell,
      List<MetaEntity> dropDownMenuItems) {
    return Container(
      //alignedDropdown: true,
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.centerLeft,
      child: DropdownButton<MetaEntity>(
          value: _meta,
          autofocus: true,
          focusColor: Colors.transparent,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          isExpanded: true,
          //style: textStyle,
          onChanged: (MetaEntity? value) {
            newCellValue = value;
            submitCell();
          },
          items: dropDownMenuItems
              .map<DropdownMenuItem<MetaEntity>>((MetaEntity value) {
            return DropdownMenuItem<MetaEntity>(
              value: value,
              child: Text(
                value.finalidad,
                style: TextStyle(fontSize: 10.0),
              ),
            );
          }).toList()),
    );
  }

  Widget _buildDropDownProceso(
      String? _proceso, CellSubmit submitCell, List<String> dropDownMenuItems) {
    return Container(
      //alignedDropdown: true,
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.centerLeft,
      child: DropdownButton<String>(
          value: _proceso,
          autofocus: true,
          focusColor: Colors.transparent,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          isExpanded: true,
          //style: textStyle,
          onChanged: (String? value) {
            newCellValue = value;
            submitCell();
          },
          items:
              dropDownMenuItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 10.0),
              ),
            );
          }).toList()),
    );
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
