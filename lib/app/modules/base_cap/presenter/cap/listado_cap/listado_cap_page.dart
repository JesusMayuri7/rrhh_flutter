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
  const ListadoCapPage({
    Key? key,
    required this.listadoBaseCap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BaseCapDataSource baseCapDataSource =
        BaseCapDataSource(this.listadoBaseCap);

    return Expanded(
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          //gridLineColor: Colors.white,
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
            // footerFrozenRowsCount: 1,
            frozenColumnsCount: 1,
            //footerFrozenColumnsCount: 1,
            isScrollbarAlwaysShown: true,
            source: baseCapDataSource,
            headerRowHeight: 23,
            rowHeight: 24,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,

            allowSorting: true,
            allowMultiColumnSorting: true,
            allowTriStateSorting: true,
            showSortNumbers: true,
            selectionMode: SelectionMode.none,
            navigationMode: GridNavigationMode.cell,
            stackedHeaderRows: getStackedHeaderRows(),
            //controller: this._dataGridController,
            columns: getColumnsCap(context),
          ),
        ),
      ),
    );
  }
}
