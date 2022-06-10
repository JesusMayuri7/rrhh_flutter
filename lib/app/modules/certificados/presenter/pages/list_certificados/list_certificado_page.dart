import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/certificado_entity.dart';

import 'package:syncfusion_flutter_core/theme.dart';

//import 'package:flutter_examples/model/sample_view.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'bloc/list_certificado_bloc.dart';
import 'bloc/list_certificado_event.dart';
import 'bloc/list_certificado_state.dart';
import 'cabecera_page.dart';
import '../widgets/certificados_datasource.dart';
import 'getColumns.dart';

/// Renders column type data grid
class ListCertificadoPage extends StatefulWidget {
  @override
  _JsonDataSourceDataGridState createState() => _JsonDataSourceDataGridState();
}

class _JsonDataSourceDataGridState extends State<ListCertificadoPage> {
  String dropdownPresupuesto = 'TODOS';
  String dropdownEstado = 'TODOS';
  late DataGridController dataGridController;
  late CertififadosDataSource jsonDataGridSource;
  final bloc = Modular.get<ListCertificadoBloc>();

  @override
  void initState() {
    super.initState();
    dataGridController = DataGridController();
    this.jsonDataGridSource =
        CertififadosDataSource(context, <CertificadoEntity>[]);
    this.jsonDataGridSource.buildDataGridRows();
    this.jsonDataGridSource.updateDataGrid();
    this.bloc.add(GetListCertificadoEvent());
  }

  @override
  Widget build(BuildContext context) {
    // print('reconstruyendo');
    return BlocBuilder(
        bloc: this.bloc,
        builder: (cpmtext, state) {
          if (state is LoadedListCertificadoState) {
            this.jsonDataGridSource.listadoCertificados =
                state.listCertificadoCur;
            this.jsonDataGridSource.buildDataGridRows();
            this.jsonDataGridSource.updateDataGrid();
          }
          return Column(mainAxisSize: MainAxisSize.min, children: [
            CabeceraPage(),
            grid(),
            (state is LoadingListCertificadoState)
                ? Center(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
            //footer(),
          ]);
        });
  }

  Widget footer() {
    return BlocBuilder<ListCertificadoBloc, ListCertificadoState>(
        bloc: this.bloc,
        builder: (context, state) {
          //dataGridController.horizontalOffset.
          return SizedBox(
            height: 35,
            child: Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: (state is LoadedListCertificadoState)
                        ? Text('Registros :' +
                            state.listCertificadoCur.length.toString())
                        : Text('0'),
                  ),
                  //Spacer(),
                  if (state is LoadedListCertificadoState)
                    Text('Total Certificado : ' +
                        state.totalCertificado.toStringAsFixed(2))
                  else
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(child: Text('Total Certificado : 0.00')),
                    )
                ]),
          );
        });
  }

  Widget grid() {
    return Expanded(
        child: SfDataGridTheme(
      data: SfDataGridThemeData(
        brightness: Theme.of(context).brightness,
        headerHoverColor: Colors.white.withOpacity(0.3),
        headerColor: Colors.lightBlue[800],
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        }),
        child: SfDataGrid(
          highlightRowOnHover: true,
          footerHeight: 150,
          frozenColumnsCount: 1,
          isScrollbarAlwaysShown: true,
          source: this.jsonDataGridSource,
          headerRowHeight: 23,
          rowHeight: 22,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          allowSorting: true,
          allowMultiColumnSorting: true,
          allowTriStateSorting: true,
          showSortNumbers: true,
          columns: getColumns(context),
          tableSummaryRows: [
            GridTableSummaryRow(
                showSummaryInRow: false,
                columns: [
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'monto',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'devengado',
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
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'enero',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'febrero',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'marzo',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'abril',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'mayo',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'junio',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'julio',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'agosto',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'setiembre',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'octubre',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'noviembre',
                      summaryType: GridSummaryType.sum),
                  GridSummaryColumn(
                      name: 'Sum',
                      columnName: 'diciembre',
                      summaryType: GridSummaryType.sum)
                ],
                position: GridTableSummaryRowPosition.bottom)
          ],
        ),
      ),
    ));
  }
}
