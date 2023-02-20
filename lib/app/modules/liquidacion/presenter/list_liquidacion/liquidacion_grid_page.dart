import 'package:collection/collection.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/list_liquidacion/bloc/liquidacion_list_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/new_liquidacion/new_liquidacion_page.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
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

  String modalidadSelected = 'CAP';

  late LiquidacionDataSource liquidacionDataSource;
  LiquidacionDetalleEntity resumenLiquidacionDetalle = LiquidacionDetalleEntity(
      clasificador: 'Todos',
      montoCertificado: 0,
      montoLiquidacion: 0,
      montoDevengado: 0,
      montoDevolucion: 0,
      id: 0);

  //final GlobalKey<SfDataGridState> keyGrid = GlobalKey<SfDataGridState>();

  @override
  void initState() {
    super.initState();
    this.liquidacionDataSource = LiquidacionDataSource(
        listLiquidacionFiltered: [], listLiquidacionOriginal: []);
    if ((this.listLiquidacionBloc.state is LiquidacionListInitial)) {
      this.listLiquidacionBloc.add(GetListLiquidacionEvent(
          anio: anioSelected!, modalidad: modalidadSelected));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocConsumer<LiquidacionListBloc, LiquidacionListState>(
        buildWhen: (previousState, newState) {
          if (newState is LiquidacionListLoaded) {
            print('aja');
            return true;
          }
          return false;
        },
        bloc: this.listLiquidacionBloc,
        listener: (context, state) {
          if (state is LiquidacionListLoaded) {
            if (state.status == LiquidacionStatus.LiquidacionListError)
              showToastError(context, 'Error de conexion');
          }
        },
        builder: (context, state) {
          if (state is LiquidacionListLoaded) {
            if ((state.status == LiquidacionStatus.LiquidacionLoaded ||
                    state.status == LiquidacionStatus.LiquidacionUpdated)
                //&& state.listLiquidacionFiltered.isNotEmpty
                ) {
              modalidadSelected = state.modalidad;
              liquidacionDataSource.listLiquidacionFiltered =
                  state.listLiquidacionFiltered;
              liquidacionDataSource.listLiquidacionOriginal =
                  state.listLiquidacion;
              liquidacionDataSource.buildDataGridRows();
              liquidacionDataSource.updateDataGrid();
              List<List<LiquidacionDetalleEntity>> data = liquidacionDataSource
                  .listLiquidacionFiltered
                  .map((e) => e.liquidacionDetalle)
                  .toList();
              List<LiquidacionDetalleEntity> flat = data.flattened.toList();
              resumenLiquidacionDetalle = flat.isEmpty
                  ? LiquidacionDetalleEntity(
                      id: 0,
                      clasificador: 'todos',
                      montoCertificado: 0,
                      montoDevengado: 0,
                      montoDevolucion: 0,
                      montoLiquidacion: 0,
                    )
                  : flat.reduce((value, element) => LiquidacionDetalleEntity(
                        id: 0,
                        clasificador: 'todos',
                        montoCertificado:
                            value.montoCertificado + element.montoCertificado,
                        montoDevengado:
                            value.montoDevengado + element.montoDevengado,
                        montoDevolucion:
                            value.montoDevolucion + element.montoDevolucion,
                        montoLiquidacion:
                            value.montoLiquidacion + element.montoLiquidacion,
                      ));
            }
          }

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3, top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 80,
                              child: f.ComboBox<String>(
                                  value: (this.listLiquidacionBloc.state
                                          is LiquidacionListLoaded)
                                      ? (this.listLiquidacionBloc.state
                                              as LiquidacionListLoaded)
                                          .modalidad
                                      : modalidadSelected,
                                  items: _modalidad
                                      .map((String dropDownStringItem) {
                                    return f.ComboBoxItem<String>(
                                      child: Text(dropDownStringItem),
                                      value: dropDownStringItem,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    this.listLiquidacionBloc.add(
                                        SetLiquidacionFilteredModalidadEvent(
                                            dscModalidad: value!));
                                    // modalidadSelected = value;

                                    //  modalidadSelected = value;
                                  }),
                            ),
                            Container(
                              width: 200,
                              child: TextFormField(
                                textAlign: TextAlign.center,
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
                                ),
                              ),
                            ),
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
                            /*     ElevatedButton(
                                onPressed: exportDataGridToExcel,
                                child: Text('Exp')), */
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
                            key: ValueKey('Master'),
                            source: liquidacionDataSource,
                            columns: getColumnsLiquidacion(),
                            allowEditing: true,
                            highlightRowOnHover: true,
                            editingGestureType: EditingGestureType.doubleTap,
                            navigationMode: GridNavigationMode.cell,
                            //controller: this._dataGridController,
                            headerRowHeight: 30,
                            columnWidthMode: ColumnWidthMode.none,
                            rowHeight: 19,
                            isScrollbarAlwaysShown: true,
                            gridLinesVisibility: GridLinesVisibility.both,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            //allowSorting: true,
                            allowFiltering: true,
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
                                      dscCertificado:
                                          liquidacion.dscCertificado,
                                      liquidacionDetalle:
                                          liquidacion.liquidacionDetalle,
                                      nombres: liquidacion.nombres));
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: Row(
                        children: [
                          Spacer(),
                          Text('Total Certificado: '),
                          Text(
                            NumberFormat('#,##0.0#', 'en_US').format(
                                double.parse(resumenLiquidacionDetalle
                                    .montoCertificado
                                    .toString())),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          );
        });
  }

/*   Future<void> exportDataGridToExcel() async {
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
  } */

/*   Future<void> exportDataGridToPdf() async {
    //if (keyGrid.currentState == null)
    {
      PdfDocument document = keyGrid.currentState!.exportToPdfDocument();
      final List<int> bytes = await document.save();
      await FileSaveHelper.saveAndLaunchFile(bytes, 'BaseCasCalculado.pdf');
    }
  } */

  _showModalDialog(_context) {
    showDialog(
        context: _context,
        builder: (BuildContext _context2) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 350,
                  height: 600,
                  child: NewLiquidacionPage(
                      contextLiq: _context,
                      anioSelected: this.anioSelected!,
                      dscModalidad: (this.listLiquidacionBloc.state
                              as LiquidacionListLoaded)
                          .modalidad)));
        });
  }

  @override
  bool get wantKeepAlive => true;
}
