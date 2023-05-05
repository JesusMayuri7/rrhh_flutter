import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/app/bloc/app_bloc.dart';

import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/bloc/liquidacion_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/report_liquidacion/bloc/liquidacion_report_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/report_liquidacion/pages/getColumnsLiquidacionReport.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'export_report_liquidacion.dart';
import 'liquidacion_report_datasource.dart';

class LiquidacionReportPage extends StatefulWidget {
  LiquidacionReportPage({Key? key}) : super(key: key);

  @override
  _LiquidacionReportPageState createState() => _LiquidacionReportPageState();
}

class _LiquidacionReportPageState extends State<LiquidacionReportPage>
    with AutomaticKeepAliveClientMixin {
  final blocLiquidacion = Modular.get<LiquidacionReportBloc>();
  final blocApp = Modular.get<LiquidacionBloc>();
  CertificadoEntity? _certificadoEntity;
  final DataGridController _dataGridController = DataGridController();
  var _modalidad = ['CAS', 'CAP'];
  String modalidadSelected = 'CAS';

  late LiquidacionReportDatasource liquidacionReportDatasource;
  final String? anioSelected = Modular.get<AppService>().sessionEntity?.anio;

  @override
  void initState() {
    liquidacionReportDatasource =
        LiquidacionReportDatasource(liquidacionReport: []);
    this.blocLiquidacion.add(LiquidacionReportLoad(anio: anioSelected!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 35,
                width: 80,
                child: fluentUi.ComboBox<String>(
                    value:
                        /* (this.blocLiquidacion.state is LiquidacionReportLoaded)
                            ? (this.blocLiquidacion.state
                                    as LiquidacionReportLoaded)
                                .dscModalidad
                            :  */
                        modalidadSelected,
                    items: _modalidad.map((String dropDownStringItem) {
                      return fluentUi.ComboBoxItem<String>(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (value) {
                      this
                          .blocLiquidacion
                          .add(LiquidacionReportFilter(dscModalidad: value!));
                      // modalidadSelected = value;
                      setState(() {
                        modalidadSelected = value;
                      });
                    }),
              ),
/*               Container(
                width: 130,
                child: LabelWithDropDown<CertificadoEntity>(
                    isExpanded: true,
                    value: _certificadoEntity,
                    dropdownMenuItemList:
                        (this.blocApp.state is LiquidacionLoadedState)
                            ? buildCertificados(
                                (this.blocApp.state as LiquidacionLoadedState)
                                    .certificados)
                            : [],
                    onChanged: (value) {
                      _certificadoEntity = value;
                      this.blocLiquidacion.add(LiquidacionReportFilter(
                          certificadoDevengadoId: _certificadoEntity?.id ?? 0));
                    },
                    title: 'Certificado'),
              ), */
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    liquidacionReportDatasource.clearFilters();
                    this.blocLiquidacion.add(LiquidacionReportLoad(
                        anio: anioSelected!, dscModalidad: modalidadSelected));
                    setState(() {
                      _certificadoEntity = null;
                    });
                  },
                  child: Text('Actualizar')),
              Spacer(),
              ElevatedButton(
                  onPressed: () => exportReportToExcel(
                      liquidacionReportDatasource.liquidacionReport),
/*                   onPressed: () => exportReportToExcel((this
                          .blocLiquidacion
                          .state is LiquidacionReportLoaded)
                      ? (this.blocLiquidacion.state as LiquidacionReportLoaded)
                          .liquidacionReportFiltered
                      : []), */
                  child: Text('Exportar')),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: BlocConsumer<LiquidacionReportBloc, LiquidacionReportState>(
              bloc: this.blocLiquidacion,
              listener: (context, state) {
                if (state is LiquidacionReportError) {
                  showToastError(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is LiquidacionReportLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is LiquidacionReportLoaded) {
                  this.liquidacionReportDatasource.liquidacionReport =
                      state.liquidacionReportFiltered;
                  this.liquidacionReportDatasource.buildDataGridRows();
                  this.liquidacionReportDatasource.updateDataGrid();
                }
                return SfDataGridTheme(
                  data: SfDataGridThemeData(
                    sortIconColor: Colors.amber,
                    brightness: Theme.of(context).brightness,
                    headerHoverColor: Colors.white.withOpacity(0.3),
                    headerColor: Colors.lightBlue[800],
                  ),
                  child: SfDataGrid(
                    key: UniqueKey(),
                    controller: _dataGridController,
                    navigationMode: GridNavigationMode.cell,
                    source: liquidacionReportDatasource,
                    columns: getColumnsLiquidacionReport(),
                    headerRowHeight: 32,
                    rowHeight: 20,
                    isScrollbarAlwaysShown: true,
                    //allowSorting: true,
                    allowFiltering: true,
                    allowMultiColumnSorting: true,
                    //allowTriStateSorting: true,
                    showSortNumbers: true,
                    selectionMode: SelectionMode.single,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    tableSummaryRows: [
                      GridTableSummaryRow(
                          showSummaryInRow: false,
                          title: 'Total Salary: {Sum} for 20 employees',
                          columns: [
                            GridSummaryColumn(
                                name: 'Count',
                                columnName: 'anio',
                                summaryType: GridSummaryType.count),
                            GridSummaryColumn(
                                name: 'Sum',
                                columnName: 'total_certificado',
                                summaryType: GridSummaryType.sum),
                            GridSummaryColumn(
                                name: 'Sum',
                                columnName: 'monto_certificado',
                                summaryType: GridSummaryType.sum),
                            GridSummaryColumn(
                                name: 'Sum',
                                columnName: 'diff_devengado',
                                summaryType: GridSummaryType.sum),
                            GridSummaryColumn(
                                name: 'Sum',
                                columnName: 'saldo_devengado',
                                summaryType: GridSummaryType.sum)
                          ],
                          position: GridTableSummaryRowPosition.bottom)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
