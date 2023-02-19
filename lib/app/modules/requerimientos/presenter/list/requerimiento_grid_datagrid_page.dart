import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../domain/requerimiento_detalle_entity.dart';
import '../../domain/requerimiento_entity.dart';
import 'bloc/requerimiento_list_bloc.dart';
import 'requerimientos_list_columns.dart';
import 'requerimientos_list_dataosurce.dart';

class RequerimientoGridDataGridPage extends StatelessWidget {
  RequerimientoGridDataGridPage(
      {Key? key,
      required this.requerimientosEntity,
      required this.context,
      required this.requerimientoListBloc})
      : super(key: key);

  final List<RequerimientoEntity> requerimientosEntity;
  final BuildContext context;
  final RequerimientoListBloc requerimientoListBloc;
  RequerimientosListDataSource? requerimientosListDataSource;

  @override
  Widget build(BuildContext context) {
    this.requerimientosListDataSource = RequerimientosListDataSource(
        listadoConfianza: this.requerimientosEntity, context: this.context);
    this.requerimientosListDataSource!.buildDataGridRows();
    this.requerimientosListDataSource!.updateDataGrid();
    return SizedBox(
        height: 500,
        child: SfDataGridTheme(
            data: SfDataGridThemeData(
              brightness: Theme.of(context).brightness,
              headerHoverColor: Colors.white.withOpacity(0.3),
              headerColor: Colors.lightBlue[800],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SfDataGrid(
                  key: ValueKey('master'),
                  highlightRowOnHover: true,
                  footerFrozenRowsCount: 0,
                  //footerFrozenColumnsCount: 1,
                  //frozenColumnsCount: 3,
                  source: requerimientosListDataSource!,
                  headerRowHeight: 25,
                  rowHeight: 25,
                  isScrollbarAlwaysShown: true,
                  gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  //allowSorting: true,
                  allowFiltering: true,
                  allowMultiColumnSorting: true,
                  allowTriStateSorting: true,
                  showSortNumbers: true,
                  selectionMode: SelectionMode.single,
                  columns: requerimientos_list_columns(context),
                  onSelectionChanged: (List<DataGridRow> addedRows,
                      List<DataGridRow> removedRows) {
                    final index = requerimientosListDataSource!.rows
                        .indexOf(addedRows.last);

                    List<RequerimientoDetalleEntity> requerimientoDetalle =
                        requerimientosListDataSource!
                            .listadoConfianza[index].requerimientoDetalle;
                    this.requerimientoListBloc.add(RequerimientoSetDetailEvent(
                        reqrerimientoDetail: requerimientoDetalle));
                  }),
            )));
  }
}
