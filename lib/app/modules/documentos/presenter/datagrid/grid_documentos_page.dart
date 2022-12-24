import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../domain/documento_entity.dart';
import 'list_documentos_datasource.dart';

class GridDocumentosPage extends StatelessWidget {
  final List<GridColumn> columns;
  final List<DocumentoEntity> data;
  final GlobalKey<SfDataGridState> keyGrid;

  final EditingGestureType editingGestureType = EditingGestureType.doubleTap;
  late ListDocumentosDataSource listDocumentosDataSource;

  /// Default sorting operating in drop down widget
  final List<String> showMenuItems = <String>[
    'Filter',
    'Clear filter',
  ];

  GridDocumentosPage(
      {required this.columns, required this.data, required this.keyGrid});

  @override
  Widget build(BuildContext context) {
    listDocumentosDataSource = ListDocumentosDataSource(
        listadoDocumentos: this.data, context: context);
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                  currentCellStyle: DataGridCurrentCellStyle(
                      borderWidth: 2, borderColor: Colors.lightBlue[800]!),
                  rowHoverColor: Colors.blue,
                  sortIconColor: Colors.white,
                  brightness: Theme.of(context).brightness,
                  headerHoverColor: Colors.white.withOpacity(0.2),
                  headerColor: Colors.lightBlue[800],
                  rowHoverTextStyle: TextStyle(color: Colors.white)),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }),
                child: Container(
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
                      footerFrozenRowsCount: 0,
                      footerFrozenColumnsCount: 1,
                      source: listDocumentosDataSource,
                      headerRowHeight: 21,
                      rowHeight: 48,
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
                      columns: this.columns,
                      tableSummaryRows: [
                        GridTableSummaryRow(
                            showSummaryInRow: false,
                            columns: [
                              GridSummaryColumn(
                                  name: 'Count',
                                  columnName: 'anio',
                                  summaryType: GridSummaryType.count)
                            ],
                            position: GridTableSummaryRowPosition.bottom)
                      ]),
                ),
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
/*     print(listDocumentosDataSource.rows
        .firstWhereIndexedOrNull(
            (index, element) => index == details.rowColumnIndex.columnIndex)!
        .getCells()
        .first
        .value); */

    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx + 200, dy + 200),
        items: buildMenuItems(details.column));
  }

  Widget buildMenuItem(GridColumn column, String value) {
    return GestureDetector(
        onTap: () {},
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
