import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../domain/entities/base_cap_entity.dart';
import '../widgets/base_cap_datasource.dart';
import '../widgets/getColumnsCap.dart';
import 'stacked_header.dart';

class ListadoCapPage extends StatelessWidget {
  final List<BaseCapEntity> listadoBaseCap;
  ListadoCapPage({
    Key? key,
    required this.listadoBaseCap,
  }) : super(key: key);

  final DataGridController _dataGridController = DataGridController();

  @override
  Widget build(BuildContext context) {
    BaseCapDataSource baseCapDataSource =
        BaseCapDataSource(this.listadoBaseCap);
    baseCapDataSource.buildDataGridRows();
    baseCapDataSource.updateDataGrid();
    return Expanded(
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          filterIconColor: Colors.black,
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
              footerHeight: 0,

              //allowSorting: true,
              allowFiltering: true,
              highlightRowOnHover: true,
              //footerFrozenRowsCount: 1,
              //footer: Container(color: Colors.amber),
              frozenColumnsCount: 1,
              //footerFrozenColumnsCount: 1,
              isScrollbarAlwaysShown: true,
              source: baseCapDataSource,
              headerRowHeight: 23,
              rowHeight: 22,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              selectionMode: SelectionMode.singleDeselect,
              navigationMode: GridNavigationMode.cell,
              stackedHeaderRows: getStackedHeaderRows(),
              controller: this._dataGridController,
              columns: getColumnsCap(context),
              tableSummaryRows: [
                GridTableSummaryRow(
                    showSummaryInRow: false,
                    columns: [
                      GridSummaryColumn(
                          name: 'Count',
                          columnName: 'codigo_plaza',
                          summaryType: GridSummaryType.count),
                      GridSummaryColumn(
                          name: 'Sum',
                          columnName: 'total_basico',
                          summaryType: GridSummaryType.sum),
                    ],
                    position: GridTableSummaryRowPosition.bottom)
              ]),
        ),
      ),
    );
  }
}
