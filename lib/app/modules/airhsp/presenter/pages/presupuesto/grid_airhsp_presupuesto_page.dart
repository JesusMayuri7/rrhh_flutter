import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';
import 'package:rrhh_clean/core/uitls/theme/theme_custon.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'widgets/airhsp_presupuesto_datasource.dart';
import 'widgets/custom_column_sizer.dart';

class GridAirhspPresupuestoPage extends StatelessWidget {

  GridAirhspPresupuestoPage({
    required this.columns,
    required this.data,
    required this.keyGrid,
  }) {
   
  }


final List<GridColumn> columns;
  final List<AirhspPresupuestoEntity> data;
  final GlobalKey<SfDataGridState> keyGrid;
  late AirhspPresupuestoDataSource airhspPresupuestoDataSource;


  final CustomColumnSizer _customColumnSizer = CustomColumnSizer();

  @override
  Widget build(BuildContext context) {
  airhspPresupuestoDataSource = AirhspPresupuestoDataSource(listadoPresupuesto: this.data, context: context);
  airhspPresupuestoDataSource.buildDataGridRows();
  airhspPresupuestoDataSource.updateDataGrid();    
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
                  key: this.keyGrid,
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
                              columnName: 'essalud_anual',
                              summaryType: GridSummaryType.sum),
                                 GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'basico_anual',
                              summaryType: GridSummaryType.sum),
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'bonificacion_familiar',
                              summaryType: GridSummaryType.sum),
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'incremento',
                              summaryType: GridSummaryType.sum),
                               GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'escolaridad',
                              summaryType: GridSummaryType.sum),
                               GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'gratificacion_julio',
                              summaryType: GridSummaryType.sum),
                               GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'gratificacion_diciembre',
                              summaryType: GridSummaryType.sum),
                               GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'gratificacion',
                              summaryType: GridSummaryType.sum),
                               GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'bonificacion_extraordinaria_julio',
                              summaryType: GridSummaryType.sum),
                              GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'bonificacion_extraordinaria_diciembre',
                              summaryType: GridSummaryType.sum),
                              GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'bonificacion_extraordinaria',
                              summaryType: GridSummaryType.sum),
                                    GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'cts_mayo',
                              summaryType: GridSummaryType.sum),
 GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'cts_noviembre',
                              summaryType: GridSummaryType.sum),
                               GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'cts',
                              summaryType: GridSummaryType.sum),
                                GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'total',
                              summaryType: GridSummaryType.sum),
                        ],
                        position: GridTableSummaryRowPosition.bottom)
                  ],                 
                  frozenColumnsCount: 1,
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
                  columns: this.columns,
                  stackedHeaderRows: <StackedHeaderRow>[
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['codigo_plaza', 'dni','nombres','cargo','nivel','estado','desc_grupo_ocupacional'],
              child: Container(
                  color: const Color(0xFFF1F1F1),
                  child: Center(child: Text('Datos de la Plaza')))),
          StackedHeaderCell(
              columnNames: ['rem_prin_ro', 'rem_prin_rdr','incremento','bonificacion_familiar','essalud'],
              child: Container(
                  color: const Color(0xFFF1F1F1),
                  child: Center(child: Text('Mensual')))),
          StackedHeaderCell(
              columnNames: ['escolaridad', 'gratificacion_julio','gratificacion_diciembre','gratificacion','basico_anual','essalud_anual',
              'bonificacion_extraordinaria_julio','bonificacion_extraordinaria_diciembre','bonificacion_extraordinaria','cts_mayo','cts_noviembre','cts','total'],
              child: Container(
                  color: const Color(0xFFF1F1F1),
                  child: Center(child: Text('Anual'))))
        ])
      ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  

}
