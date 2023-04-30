import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';
import 'package:rrhh_clean/core/uitls/theme/theme_custon.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'airhsp_presupuesto_datasource.dart';
import 'custom_column_sizer.dart';

class GridAirhspPresupuestoPage extends StatefulWidget {
  final List<GridColumn> columns;
  final List<AirhspPresupuestoEntity> data;
  final GlobalKey<SfDataGridState> keyGrid;

  GridAirhspPresupuestoPage({
    required this.columns,
    required this.data,
    required this.keyGrid,
  }) {}

  @override
  State<GridAirhspPresupuestoPage> createState() =>
      _GridAirhspPresupuestoPageState();
}

class _GridAirhspPresupuestoPageState extends State<GridAirhspPresupuestoPage> {
  final EditingGestureType editingGestureType = EditingGestureType.doubleTap;
  late AirhspPresupuestoDataSource airhspPresupuestoDataSource;

  @override
  void initState() {
    airhspPresupuestoDataSource = AirhspPresupuestoDataSource(
        listadoPresupuesto: widget.data, context: context);
    super.initState();
  }

  /// Default sorting operating in drop down widget
  final List<String> showMenuItems = <String>[
    'Filter',
    'Clear filter',
  ];

  final CustomColumnSizer _customColumnSizer = CustomColumnSizer();

  @override
  Widget build(BuildContext context) {
    final ThemeCustom? theme = Theme.of(context).extension<ThemeCustom>();
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                  currentCellStyle: DataGridCurrentCellStyle(
                      borderWidth: 2, borderColor: theme!.colorPrimary),
                  rowHoverColor: Colors.blue,
                  sortIconColor: Colors.redAccent,
                  brightness: Theme.of(context).brightness,
                  headerHoverColor: Colors.white.withOpacity(0.3),
                  headerColor: theme.colorPrimary,
                  rowHoverTextStyle: TextStyle(color: Colors.white)),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }),
                child: SfDataGrid(
                  key: this.widget.keyGrid,
                  columnSizer: _customColumnSizer,
                  highlightRowOnHover: true,
                  tableSummaryRows: [
                    GridTableSummaryRow(
                        showSummaryInRow: false,
                        columns: [
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'codigo_plaza',
                              summaryType: GridSummaryType.count),
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'rem_prin_ro',
                              summaryType: GridSummaryType.sum),
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'rem_prin_rdr',
                              summaryType: GridSummaryType.sum),
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'essalud',
                              summaryType: GridSummaryType.sum),
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'bonificacion_familiar',
                              summaryType: GridSummaryType.sum),
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'incremento',
                              summaryType: GridSummaryType.sum)
                        ],
                        position: GridTableSummaryRowPosition.bottom)
                  ],

                  footerFrozenColumnsCount: 1,
                  frozenColumnsCount: 3,
                  source: airhspPresupuestoDataSource,
                  headerRowHeight: 30,
                  rowHeight: 20,
                  isScrollbarAlwaysShown: true,
                  gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  //allowSorting: true,
                  allowFiltering: true,
                  selectionMode: SelectionMode.single,
                  navigationMode: GridNavigationMode.cell,
                  allowEditing: true,
                  editingGestureType: editingGestureType,
                  columns: this.widget.columns,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
