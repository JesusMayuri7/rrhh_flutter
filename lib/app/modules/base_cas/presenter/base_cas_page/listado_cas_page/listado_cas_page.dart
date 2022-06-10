import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/uitls/device_info.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../domain/entities/base_cas_entity.dart';

import 'widgets/base_cas_datasource.dart';
import 'widgets/getColumns.dart';

class ListadoCasPage extends StatelessWidget {
  ListadoCasPage({
    required this.listadoCas,
  });

  final DataGridController _dataGridController = DataGridController();

  //this.jsonDataGridSource = BaseCasDataSource(context, <BaseCasEntity>[]);

  final List<BaseCasEntity> listadoCas;

  void buildShowMenu(BuildContext context, DataGridCellTapDetails details) {
    double dx = 0.0, dy = 0.0;
    const double rowHeight = 80.0;
    if (DeviceInfo.isDesktopOrWeb) {
      final RenderBox getBox = context.findRenderObject()! as RenderBox;
      final Offset local = getBox.globalToLocal(details.globalPosition);
      dx = local.dx - details.localPosition.dx;
      dy = local.dy - details.localPosition.dy + rowHeight;
      // After Flutter v2.0, the 8.0 pixels added extra to the showMenu by default in the web and desktop.
      // Removed the extra pixels to aligned the pop up in the bottom of header cell.
      //dy -= 8.0;
    } else {
      dx = details.globalPosition.dx - details.localPosition.dx;
      dy = details.globalPosition.dy - details.localPosition.dy + rowHeight;
      // After Flutter v2.0, the 24.0 pixels added extra to the showMenu by default in the mobile.
      // Removed the extra pixels to aligned the pop up in the bottom of header cell.
      dy -= 24.0;
    }

    //print(details.)

    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx + 200, dy + 200),
        items: <PopupMenuItem<String>>[
          PopupMenuItem<String>(
              value: 'AA',
              child: Container(width: 130, height: 30, child: Text('value'))),
          PopupMenuItem<String>(
              value: 'BBB',
              child: Container(width: 130, height: 30, child: Text('value'))),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final BaseCasDataSource jsonDataGridSource = BaseCasDataSource(listadoCas);
    jsonDataGridSource.buildDataGridRows();
    jsonDataGridSource.updateDataGrid();
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
            footerFrozenRowsCount: 1,
            //footer: Container(color: Colors.amber),
            frozenColumnsCount: 1,
            //footerFrozenColumnsCount: 1,
            isScrollbarAlwaysShown: true,
            source: jsonDataGridSource,
            headerRowHeight: 23,
            rowHeight: 22,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            //allowSorting: true,
            allowMultiColumnSorting: true,
            //allowTriStateSorting: true,
            //showSortNumbers: true,
            selectionMode: SelectionMode.singleDeselect,
            navigationMode: GridNavigationMode.cell,
            controller: this._dataGridController,
            columns: getColumns(context),
            onCellTap: (DataGridCellTapDetails details) {
              if (details.rowColumnIndex.rowIndex == 0) {
                // buildShowMenu(context, details);
                //  buildShowMenu(context, details);
              }
            },
          ),
        ),
      ),
    );
  }
}
