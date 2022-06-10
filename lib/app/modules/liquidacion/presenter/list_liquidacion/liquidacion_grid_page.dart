import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/list_liquidacion/bloc/liquidacion_list_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/new_liquidacion/new_liquidacion_page.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'export_liquidacion.dart';
import 'getColumnsLiquidacion.dart';
import 'liquidacion_datasource.dart';

class LiquidacionGridPage extends StatefulWidget {
  LiquidacionGridPage({Key? key}) : super(key: key);

  @override
  _LiquidacionGridPageState createState() => _LiquidacionGridPageState();
}

class _LiquidacionGridPageState extends State<LiquidacionGridPage>
    with AutomaticKeepAliveClientMixin {
  final listLiquidacionBloc = Modular.get<LiquidacionListBloc>();

  DataGridRow? rowSelection;

  var _modalidad = ['CAS', 'CAP'];

  //String anioSelected = DateFormat('y').format(DateTime.now());
  final String? anioSelected =
      (Modular.get<AuthBloc>().state).loginResponseEntity!.anio;

  String modalidadSelected = 'CAS';
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  late LiquidacionDataSource liquidacionDataSource;

  final GlobalKey<SfDataGridState> keyGrid = GlobalKey<SfDataGridState>();

  @override
  void initState() {
    super.initState();

    /*this.listLiquidacionBloc.add(GetLiquidacionFillFormEvent(
        anio: anioSelected, modalidad: modalidadSelected));*/

    this.listLiquidacionBloc.add(GetListLiquidacionEvent(
        anio: anioSelected!, modalidad: modalidadSelected));

    this.liquidacionDataSource =
        LiquidacionDataSource(listLiquidacionFiltered: []);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocConsumer<LiquidacionListBloc, LiquidacionListState>(
        buildWhen: (previousState, newState) {
          if (newState is LiquidacionListLoaded) return true;
          return false;
        },
        bloc: this.listLiquidacionBloc,
        listener: (context, state) {
          if (state is LiquidacionListLoaded) {
            if (state.status == LiquidacionStatus.LiquidacionListError)
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Error: ')));
          }
        },
        builder: (context, state) {
          if (state is LiquidacionListLoaded) {
            liquidacionDataSource.listLiquidacionFiltered =
                state.listLiquidacionFiltered;
            liquidacionDataSource.buildDataGridRows();
            liquidacionDataSource.updateDataGrid();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              //alignedDropdown: true,
                              child: DropdownButton<String>(
                                  iconEnabledColor: Colors.blue,
                                  value: (this.listLiquidacionBloc.state
                                          is LiquidacionListLoaded)
                                      ? (this.listLiquidacionBloc.state
                                              as LiquidacionListLoaded)
                                          .modalidad
                                      : modalidadSelected,
                                  items: _modalidad
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      child: Text(dropDownStringItem),
                                      value: dropDownStringItem,
                                    );
                                  }).toList(),
                                  hint: new Text("Modalidad"),
                                  onChanged: (value) {
                                    this.listLiquidacionBloc.add(
                                        SetLiquidacionFilteredModalidadEvent(
                                            dscModalidad: value!));
                                    // modalidadSelected = value;
                                    modalidadSelected = value;
                                  }),
                            ),
                            Container(
                                width: 200,
                                child: TextFormField(
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.text,
                                    onFieldSubmitted: (value) {
                                      this.listLiquidacionBloc.add(
                                          SetLiquidacionFilteredTextEvent(
                                              modalidad: modalidadSelected,
                                              anio: anioSelected!,
                                              criterio: value));
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Filtrar',
                                      prefixIcon: Icon(Icons.search_outlined),
                                      // set the prefix icon constraints
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 25,
                                        minHeight: 25,
                                      ),
                                      border: OutlineInputBorder(),
                                      isDense: true, // Added this
                                      contentPadding: EdgeInsets.only(
                                          left: 5,
                                          top: 12,
                                          bottom: 0), // Added this
                                    ))),
                            ElevatedButton(
                                onPressed: () => this.listLiquidacionBloc.add(
                                    GetListLiquidacionEvent(
                                        anio: anioSelected!,
                                        modalidad: (this
                                                .listLiquidacionBloc
                                                .state is LiquidacionListLoaded)
                                            ? (this.listLiquidacionBloc.state
                                                    as LiquidacionListLoaded)
                                                .modalidad
                                            : modalidadSelected)),
                                child: Text('Actualizar')),
                            ElevatedButton(
                                onPressed: exportDataGridToExcel,
                                child: Text('Exp')),
                            ElevatedButton(
                                onPressed: () => exportLiquidaciontoExcel((this
                                        .listLiquidacionBloc
                                        .state is LiquidacionListLoaded)
                                    ? (this.listLiquidacionBloc.state
                                            as LiquidacionListLoaded)
                                        .listLiquidacionFiltered
                                    : []),
                                child: Text('Exportar')),
                            ElevatedButton(
                                onPressed: () => _showModalDialog(context),
                                child: Text('Nuevo')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SfDataGridTheme(
                      data: SfDataGridThemeData(
                        brightness: Theme.of(context).brightness,
                        headerHoverColor: Colors.white.withOpacity(0.3),
                        headerColor: Colors.lightBlue[800],
                      ),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                            dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse
                            }),
                        child: SfDataGrid(
                          key: keyGrid,
                          source: liquidacionDataSource,
                          columns: getColumnsLiquidacion(),
                          allowEditing: true,
                          highlightRowOnHover: true,
                          editingGestureType: EditingGestureType.doubleTap,
                          navigationMode: GridNavigationMode.cell,
                          //controller: this._dataGridController,
                          headerRowHeight: 30,
                          footer: Container(),
                          footerHeight: 25,
                          rowHeight: 19,
                          isScrollbarAlwaysShown: true,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                          allowSorting: true,
                          allowMultiColumnSorting: true,
                          allowTriStateSorting: true,
                          showSortNumbers: true,
                          selectionMode: SelectionMode.single,

                          onSelectionChanged: (List<DataGridRow> addedRows,
                              List<DataGridRow> removedRows) {
                            final index = liquidacionDataSource.rows
                                .indexOf(addedRows.last);

                            LiquidacionEntity liquidacion =
                                liquidacionDataSource
                                    .listLiquidacionFiltered[index];

                            this.listLiquidacionBloc.add(
                                SetLiquidacionDetalleEvent(
                                    dscCertificado: liquidacion.dscCertificado,
                                    liquidacionDetalle:
                                        liquidacion.liquidacionDetalle,
                                    nombres: liquidacion.nombres));
                          },
                        ),
                      ),
                    ),
                  ),
                ]),
          );
        });
  }

  Future<void> exportDataGridToExcel() async {
    final Workbook workbook = keyGrid.currentState!.exportToExcelWorkbook(
        cellExport: (DataGridCellExcelExportDetails details) {
      if (details.cellType == DataGridExportCellType.columnHeader) {
        final bool isRightAlign = details.columnName == 'Product No' ||
            details.columnName == 'Shipped Date' ||
            details.columnName == 'Price';
        details.excelRange.cellStyle.hAlign =
            isRightAlign ? HAlignType.right : HAlignType.left;
      }
    });
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await FileSaveHelper.saveAndLaunchFile(bytes, 'BaseCasCalculado.xlsx');
  }

  Future<void> exportDataGridToPdf() async {
    //if (keyGrid.currentState == null)
    {
      PdfDocument document = keyGrid.currentState!.exportToPdfDocument();
      final List<int> bytes = document.save();
      await FileSaveHelper.saveAndLaunchFile(bytes, 'BaseCasCalculado.pdf');
    }
  }

  _showModalDialog(_context) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 350,
                  height: 600,
                  child: NewLiquidacionPage(
                      anioSelected: this.anioSelected!,
                      dscModalidad: (this.listLiquidacionBloc.state
                              as LiquidacionListLoaded)
                          .modalidad)));
        });
  }

  @override
  bool get wantKeepAlive => true;
}
