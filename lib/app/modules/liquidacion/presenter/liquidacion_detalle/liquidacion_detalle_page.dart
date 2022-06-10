import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'bloc/liquidacion_detalle_bloc.dart';
import 'getColumnsLiquidacionDetalle.dart';
import 'liquidacion_detalle_datasource.dart';

class LiquidacionDetallePage extends StatefulWidget {
  LiquidacionDetallePage({Key? key}) : super(key: key);
  @override
  _LiquidacionDetallePageState createState() => _LiquidacionDetallePageState();
}

class _LiquidacionDetallePageState extends State<LiquidacionDetallePage> {
  bool allClasificador = false;

  final blocDetalle = Modular.get<LiquidacionDetalleBloc>();

  final DataGridController _dataGridController = DataGridController();

  late LiquidacionDetalleDataSource liquidacionDetalleDataSource;

  @override
  Widget build(BuildContext context) {
    liquidacionDetalleDataSource = LiquidacionDetalleDataSource(
        bloc: this.blocDetalle, listLiquidacionDetalle: []);
    return BlocConsumer<LiquidacionDetalleBloc, LiquidacionDetalleState>(
        listener: (context, newState) {
          if (newState is LiquidacionDetalleError)
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(newState.message)));
        },
        buildWhen: (previousState, newState) {
          if (newState is LiquidacionDetalleLoaded) return true;
          return false;
        },
        bloc: this.blocDetalle,
        builder: (context, stateDetalle) {
          if (stateDetalle is LiquidacionDetalleLoaded) {
            liquidacionDetalleDataSource.listLiquidacionDetalle =
                stateDetalle.liquidacionDetalle;
            liquidacionDetalleDataSource.buildDataGridRows();
            liquidacionDetalleDataSource.updateDataGrid();
          }
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(child: Text('Detalle de Liquidacion')),
                Container(
                    child: Text((stateDetalle is LiquidacionDetalleLoaded)
                        ? stateDetalle.nombres
                        : '')),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                      brightness: Theme.of(context).brightness,
                      headerHoverColor: Colors.white.withOpacity(0.3),
                      headerColor: Colors.lightBlue[800],
                    ),
                    child: SfDataGrid(
                      key: UniqueKey(),
                      tableSummaryRows: [
                        GridTableSummaryRow(
                            showSummaryInRow: false,
                            columns: [
                              GridSummaryColumn(
                                  name: 'Sum',
                                  columnName: 'monto_certificado',
                                  summaryType: GridSummaryType.sum),
                              GridSummaryColumn(
                                  name: 'Sum',
                                  columnName: 'monto_devengado',
                                  summaryType: GridSummaryType.sum),
                              GridSummaryColumn(
                                  name: 'Sum',
                                  columnName: 'monto_liquidacion',
                                  summaryType: GridSummaryType.sum),
                              GridSummaryColumn(
                                  name: 'Sum',
                                  columnName: 'monto_devolucion',
                                  summaryType: GridSummaryType.sum),
                              GridSummaryColumn(
                                  name: 'Sum',
                                  columnName: 'saldo',
                                  summaryType: GridSummaryType.sum)
                            ],
                            position: GridTableSummaryRowPosition.bottom)
                      ],
                      allowEditing: true,
                      editingGestureType: EditingGestureType.tap,
                      navigationMode: GridNavigationMode.cell,
                      source: liquidacionDetalleDataSource,
                      selectionMode: this.allClasificador
                          ? SelectionMode.none
                          : SelectionMode.single,
                      columns: getColumnsLiquidacionDetalle(),
                      headerRowHeight: 35,
                      rowHeight: 25,
                      controller: _dataGridController,
                      isScrollbarAlwaysShown: true,
                      gridLinesVisibility: GridLinesVisibility.both,
                      headerGridLinesVisibility: GridLinesVisibility.both,
                      onSelectionChanged: (List<DataGridRow> addedRows,
                          List<DataGridRow> removedRows) {
                        /*
                        this.blocDetalle.add(
                              SetLiquidacionResumenEvent(
                                  allClasificador: allClasificador,
                                  dscClasificador: this
                                      ._dataGridController
                                      .selectedRows
                                      .first
                                      .getCells()
                                      .where((element) =>
                                          element.columnName == 'clasificador')
                                      .first
                                      .value,
                                  //listLliquidacion:(stateDetalle as LiquidacionDetalleLoaded).liquidacion,
                                  listLliquidacion: [],
                                  dscCertificado:
                                      (stateDetalle is LiquidacionListLoaded)
                                          ? stateDetalle.dscCertificado
                                          : 'TODOS'),
                            );*/
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
