import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/list_practicante_datasource.dart';

class GridPracPage extends StatelessWidget {
  final List<GridColumn> columns;
  final List<PracticanteEntity> data;
  final GlobalKey<SfDataGridState> keyGrid;

  EditingGestureType editingGestureType = EditingGestureType.doubleTap;
  late ListPracticanteDataSource listPracticanteDataSource;

  /// Default sorting operating in drop down widget
  List<String> showMenuItems = <String>[
    'Filter',
    'Clear filter',
  ];

  GridPracPage(
      {required this.columns, required this.data, required this.keyGrid});

  @override
  Widget build(BuildContext context) {
    listPracticanteDataSource = ListPracticanteDataSource(
        listadoPracticante: this.data, context: context);
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                  currentCellStyle: DataGridCurrentCellStyle(
                      borderWidth: 2, borderColor: Colors.lightBlue[800]!),
                  rowHoverColor: Colors.blue,
                  sortIconColor: Colors.redAccent,
                  brightness: Theme.of(context).brightness,
                  headerHoverColor: Colors.white.withOpacity(0.3),
                  headerColor: Colors.lightBlue[800],
                  rowHoverTextStyle: TextStyle(color: Colors.white)),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }),
                child: SfDataGrid(
                    key: this.keyGrid,
                    footer: Container(),
                    onCellSecondaryTap: (DataGridCellTapDetails details) {
                      if (details.rowColumnIndex.rowIndex > 0) {
                        buildShowMenu(context, details);
                      }
                    },
                    footerHeight: 5,
                    highlightRowOnHover: true,
                    tableSummaryRows: [
                      GridTableSummaryRow(
                          showSummaryInRow: false,
                          columns: [
                            GridSummaryColumn(
                                name: 'Sum',
                                columnName: 'codigo_plaza',
                                summaryType: GridSummaryType.count)
                          ],
                          position: GridTableSummaryRowPosition.bottom)
                    ],
                    footerFrozenRowsCount: 0,
                    footerFrozenColumnsCount: 1,
                    frozenColumnsCount: 3,
                    source: listPracticanteDataSource,
                    headerRowHeight: 21,
                    rowHeight: 18,
                    isScrollbarAlwaysShown: true,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    allowSorting: true,
                    allowMultiColumnSorting: true,
                    allowTriStateSorting: true,
                    showSortNumbers: true,
                    selectionMode: SelectionMode.single,
                    navigationMode: GridNavigationMode.cell,
                    allowEditing: true,
                    editingGestureType: editingGestureType,
                    columns: this.columns),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buildShowMenu(BuildContext context, DataGridCellTapDetails details) {
    double dx = 0.0, dy = 0.0;
    const double rowHeight = 56.0;
    if (true) {
      final RenderBox getBox = context.findRenderObject()! as RenderBox;
      final Offset local = getBox.globalToLocal(details.globalPosition);
      dx = local.dx - details.localPosition.dx;
      dy = local.dy - details.localPosition.dy + rowHeight;
      // After Flutter v2.0, the 8.0 pixels added extra to the showMenu by default in the web and desktop.
      // Removed the extra pixels to aligned the pop up in the bottom of header cell.
      dy -= 0.0;
    }
    print(listPracticanteDataSource.rows
        .firstWhereIndexedOrNull(
            (index, element) => index == details.rowColumnIndex.columnIndex)!
        .getCells()
        .first
        .value);

    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx + 200, dy + 200),
        items: buildMenuItems(details.column));
  }

  Widget buildMenuItem(GridColumn column, String value) {
    return GestureDetector(
        onTap: () {
          print('filtro ' + column.columnName);
        },
        child: Container(width: 130, height: 30, child: Text(value)));
  }

  List<PopupMenuItem<String>> buildMenuItems(GridColumn column) {
    List<PopupMenuItem<String>> menuItems;

    menuItems = <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: showMenuItems[0],
        //enabled: isEnabled(DataGridSortDirection.descending),
        child: buildMenuItem(column, showMenuItems[0]),
      ),
      PopupMenuItem<String>(
        value: showMenuItems[1],
        //enabled: isEnabled(DataGridSortDirection.ascending),
        child: buildMenuItem(column, showMenuItems[1]),
      ),
    ];

    return menuItems;
  }
}
