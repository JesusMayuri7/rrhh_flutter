import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/subsidio/bloc/subsidio_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/bloc/subsidio_devolucion_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/new_subsidio/new_subsidio_devolucion_page.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

class SubsidioDevolucionGridDataSource extends DataGridSource {
  List<SubsidioDevolucionEntity> subsidioDevolucionFiltered = [];
  List<DataGridRow> subsidioDevolucionDataGridRows = [];

  final blocSubsidio = Modular.get<SubsidioBloc>();
  final blocSubsidioDevolucionList = Modular.get<SubsidioDevolucionBloc>();
  BuildContext context;

  final DataGridController dataGridController;

  SubsidioDevolucionGridDataSource(
      {required this.subsidioDevolucionFiltered,
      required this.context,
      required this.dataGridController}) {
    buildDataGridRows();
  }

  @override
  List<DataGridRow> get rows => subsidioDevolucionDataGridRows;

  void buildDataGridRows() {
    subsidioDevolucionDataGridRows = subsidioDevolucionFiltered
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<int>(columnName: 'anio', value: dataGridRow.anio),
              DataGridCell<int>(
                  columnName: 'modalidad_id', value: dataGridRow.modalidadId),
              DataGridCell<String>(
                  columnName: 'dsc_modalidad', value: dataGridRow.dscModalidad),
              DataGridCell<String>(columnName: 'tipo', value: dataGridRow.tipo),
              DataGridCell<int>(
                  columnName: 'certificado_id',
                  value: dataGridRow.certificadoId),
              DataGridCell<String>(
                  columnName: 'dsc_certificado',
                  value: dataGridRow.dscCertificado),
              DataGridCell<int>(
                  columnName: 'fuente_id', value: dataGridRow.fuenteId),
              DataGridCell<String>(
                  columnName: 'dsc_fuente', value: dataGridRow.dscFuente),
              DataGridCell<int>(
                  columnName: 'meta_id', value: dataGridRow.metaId),
              DataGridCell<String>(
                  columnName: 'dsc_meta', value: dataGridRow.dscMeta),
              DataGridCell<String>(columnName: 'dni', value: dataGridRow.dni),
              DataGridCell<String>(
                  columnName: 'nombres', value: dataGridRow.nombres),
              DataGridCell<String>(
                  columnName: 'expediente', value: dataGridRow.expediente),
              DataGridCell<int>(
                  columnName: 'clasificador_id',
                  value: dataGridRow.clasificadorId),
              DataGridCell<String>(
                  columnName: 'dsc_clasificador',
                  value: dataGridRow.dscClasificador),
              DataGridCell<int>(
                  columnName: 'mes_proceso', value: dataGridRow.mesProceso),
              DataGridCell<String>(
                  columnName: 'fecha_devengado',
                  value: dataGridRow.fechaDevengado),
              DataGridCell<double>(
                  columnName: 'monto_devolucion',
                  value: dataGridRow.montoDevolucion),
              DataGridCell<String>(
                  columnName: 'codigo_plaza', value: dataGridRow.codigoPlaza),
              DataGridCell<String>(
                  columnName: 'codigo_siga', value: dataGridRow.codigoSiga),
              DataGridCell<String>(
                  columnName: 'estado', value: dataGridRow.estado),
              DataGridCell<SubsidioDevolucionEntity>(
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
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
        alignment: Alignment.centerRight,
        child: Text(
          NumberFormat('#,##0.00', 'en_US').format(
            num.parse(summaryValue.isEmpty ? '0' : summaryValue),
          ),
          style: TextStyle(fontSize: 12),
          //e.value.toString(),
          maxLines: 1,
        ));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // Set row color is diferent Certificado, Fuente y Meta
    Color getRowBackgroundColor() {
      final int certificadoId = row.getCells()[3].value;
      final int certificadoDevengadoId = row.getCells()[12].value;

      final int fuenteId = row.getCells()[5].value;
      final int fuenteDevengadoId = row.getCells()[14].value;

      final int metaId = row.getCells()[6].value;
      final int metaDevengadoId = row.getCells()[15].value;

      final String expediente = row.getCells()[10].value;

      if (certificadoId == 0) {
        return Colors.blue[200]!;
      } else if (fuenteId != fuenteDevengadoId ||
          certificadoId != certificadoDevengadoId ||
          metaId != metaDevengadoId) {
        return Colors.red[300]!;
      } else if (expediente.isEmpty)
        return Colors.amber[300]!;
      else
        return Colors.transparent;
    }

    return DataGridRowAdapter(
        // color: getRowBackgroundColor(),
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == 'acciones') {
        return LayoutBuilder(
            builder: (BuildContext contextLayout, BoxConstraints constraints) {
          return TextButton(
            child: Text('Editar'),
            onPressed: () {
              _showModalDialog(contextLayout, e.value);
            },
          );
        });
      } else if (e.columnName == 'dsc_meta' ||
          e.columnName == 'dsc_certificado' ||
          e.columnName == 'nombres' ||
          e.columnName == 'dsc_fuente' ||
          e.columnName == 'dsc_clasificador') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
            alignment: Alignment.centerLeft,
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 10),
            ));
      }
      if (e.columnName == 'monto_devolucion') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
            alignment: Alignment.centerRight,
            child: Text(
              NumberFormat('#,##0.00', 'en_US').format(
                double.parse(e.value.toString()),
              ),
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
    return null;

    // Text going to display on editable widget
    /*
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';
    newCellValue = null;


    if (column.columnName == 'dsc_certificado') {
      CertificadoEntity? selectedCertificado = displayText.isEmpty
          ? null
          : (this.blocSubsidio.state as SubsidioLoaded)
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
          (this.blocSubsidio.state as SubsidioLoaded).certificados);
    }

    if (column.columnName == 'dsc_fuente') {
      FuenteEntity? selectedFuente = displayText.isEmpty
          ? null
          : (this.blocSubsidio.state as SubsidioLoaded)
              .fuentes
              .where((element) =>
                  element.id ==
                  dataGridRow
                      .getCells()
                      .where((element) => element.columnName == 'fuente_id')
                      .first
                      .value)
              .first;
      return _buildDropDownFuente(selectedFuente, submitCell,
          (this.blocSubsidio.state as SubsidioLoaded).fuentes);
    }

    if (column.columnName == 'dsc_meta') {
      MetaEntity? selectedMeta = displayText.isEmpty
          ? null
          : (this.blocSubsidio.state as SubsidioLoaded)
              .metas
              .where((element) =>
                  element.idmetaAnual ==
                  dataGridRow
                      .getCells()
                      .where((element) => element.columnName == 'meta_id')
                      .first
                      .value)
              .first;
      return _buildDropDownMetas(selectedMeta, submitCell,
          (this.blocSubsidio.state as SubsidioLoaded).metas);
    }

    if (column.columnName == 'dsc_clasificador') {
      ClasificadorEntity? selectedClasificador = displayText.isEmpty
          ? null
          : (this.blocSubsidio.state as SubsidioLoaded)
              .clasificadores
              .where((element) =>
                  element.id ==
                  dataGridRow
                      .getCells()
                      .where(
                          (element) => element.columnName == 'clasificador_id')
                      .first
                      .value)
              .first;
      return _buildDropDownClasificador(selectedClasificador, submitCell,
          (this.blocSubsidio.state as SubsidioLoaded).clasificadores);
    }

    if (column.columnName == 'codigo_plaza' ||
        column.columnName == 'dni' ||
        column.columnName == 'nombres' ||
        column.columnName == 'expediente' ||
        column.columnName == 'codigo_siga') {
      return _buildTextFieldWidget(displayText, column, submitCell);
    }

    */
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
    //final int dataRowIndex = subsidioDevolucionDataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }
/*
    if (column.columnName == 'dsc_certificado') {

      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: subsidioDevolucionFiltered,
          liquidacionId: subsidioDevolucionFiltered[dataRowIndex].id,
          campo: 'certificado_id',
          valor: (newCellValue as SubsidioDevolucionEntity).id));

      //buildDataGridRows();
    }

    if (column.columnName == 'dsc_certificado_devengado') {


      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: subsidioDevolucionFiltered,
          liquidacionId: subsidioDevolucionFiltered[dataRowIndex].id,
          campo: 'certificado_devengado_id',
          valor: (newCellValue as SubsidioDevolucionEntity).id));

      //buildDataGridRows();
    }
    if (column.columnName == 'finalidad') {

      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: subsidioDevolucionFiltered,
          liquidacionId: subsidioDevolucionFiltered[dataRowIndex].id,
          campo: 'meta_id',
          valor: (newCellValue as MetaEntity).idmetaAnual));

      //buildDataGridRows();
    }

    if (column.columnName == 'finalidad_devengado') {


      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: subsidioDevolucionFiltered,
          liquidacionId: subsidioDevolucionFiltered[dataRowIndex].id,
          campo: 'meta_devengado_id',
          valor: (newCellValue as MetaEntity).idmetaAnual));

      //buildDataGridRows();
    }

    if (column.columnName == 'codigo_plaza' ||
        column.columnName == 'dni' ||
        column.columnName == 'nombres' ||
        column.columnName == 'expediente' ||
        column.columnName == 'fuente_devengado_id' ||
        column.columnName == 'codigo_siga') {
      this.blocLiquidacionList.add(UpdateLiquidacionEvent(
          liquidacion: subsidioDevolucionFiltered,
          liquidacionId: subsidioDevolucionFiltered[dataRowIndex].id,
          campo: column.columnName,
          valor: (newCellValue.toString())));

      //buildDataGridRows();
    }
  */
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
              newCellValue = column.columnName == 'dsc_fuente' ||
                      column.columnName == 'fuente_id'
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

            newCellValue = value;
 
            submitCell();
            submitCell();
          },
          items: dropDownMenuItems.map<DropdownMenuItem<CertificadoEntity>>(
              (CertificadoEntity value) {
            return DropdownMenuItem<CertificadoEntity>(
              value: value,
              child: Text(
                value.dscCertificado,
                style: TextStyle(fontSize: 12.0),
              ),
            );
          }).toList()),
    );
  }

  Widget _buildDropDownFuente(FuenteEntity? _fuente, CellSubmit submitCell,
      List<FuenteEntity> dropDownMenuItems) {
    if (_fuente == null)
      print('vacio');
    else
      print('selected ' + _fuente.toString());
    return Container(
      //alignedDropdown: true,
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.centerLeft,
      child: DropdownButton<FuenteEntity>(
          value: _fuente,
          autofocus: true,
          focusColor: Colors.transparent,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          isExpanded: true,
          //style: textStyle,
          onChanged: (FuenteEntity? value) {

            newCellValue = value;

            submitCell();

            submitCell();
          },
          items: dropDownMenuItems
              .map<DropdownMenuItem<FuenteEntity>>((FuenteEntity value) {
            return DropdownMenuItem<FuenteEntity>(
              value: value,
              child: Text(
                value.abvFuente,
                style: TextStyle(fontSize: 12.0),
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
                style: TextStyle(fontSize: 12.0),
              ),
            );
          }).toList()),
    );
  }

  Widget _buildDropDownClasificador(ClasificadorEntity? _meta,
      CellSubmit submitCell, List<ClasificadorEntity> dropDownMenuItems) {
    return Container(
      //alignedDropdown: true,
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.centerLeft,
      child: DropdownButton<ClasificadorEntity>(
          value: _meta,
          autofocus: true,
          focusColor: Colors.transparent,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          isExpanded: true,
          //style: textStyle,
          onChanged: (ClasificadorEntity? value) {
            newCellValue = value;
            submitCell();
          },
          items: dropDownMenuItems.map<DropdownMenuItem<ClasificadorEntity>>(
              (ClasificadorEntity value) {
            return DropdownMenuItem<ClasificadorEntity>(
              value: value,
              child: Text(
                value.dscClasificador,
                style: TextStyle(fontSize: 12.0),
              ),
            );
          }).toList()),
    );
  }

  _showModalDialog(_context, SubsidioDevolucionEntity row) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 380,
                  height: 550,
                  child: NewSubsidioDevolucionPage(
                    params: ParamsNewSubsidio(
                        anio: row.anio,
                        certificadoId: row.certificadoId,
                        clasificadorId: row.clasificadorId,
                        codigoPlaza: row.codigoPlaza,
                        codigoSiga: row.codigoSiga,
                        dni: row.dni,
                        expediente: row.expediente,
                        fechaDevengado: row.fechaDevengado,
                        fuenteId: row.fuenteId,
                        id: row.id,
                        metaId: row.metaId,
                        modalidadId: row.modalidadId,
                        monto: row.montoDevolucion,
                        nombres: row.nombres,
                        estado: row.estado),
                    dscModalidad: row.dscModalidad,
                  )));
        });
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
