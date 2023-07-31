import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_ext_entity.dart';
import 'package:rrhh_clean/core/uitls/theme/theme_custon.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../presupuesto/custom_column_sizer.dart';
import 'airhsp_detalle_datasource.dart';

class GridAirhspDetallePage extends StatelessWidget {

  GridAirhspDetallePage({
    required this.columns,
    required this.data,
    required this.keyGrid,
  }) {
   
  }


final List<GridColumn> columns;
  final List<AirhspExtEntity>data;
  final GlobalKey<SfDataGridState> keyGrid;
  late AirhspDetalleDataSource airhspPresupuestoDataSource;


  final CustomColumnSizer _customColumnSizer = CustomColumnSizer();

  @override
  Widget build(BuildContext context) {
  airhspPresupuestoDataSource = AirhspDetalleDataSource(listadoDetalle: [], context: context);
  airhspPresupuestoDataSource.buildDataGridRows();
  airhspPresupuestoDataSource.updateDataGrid();    
    final ThemeCustom? theme = Theme.of(context).extension<ThemeCustom>();
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                selectionColor: Colors.grey[350],
                  currentCellStyle: DataGridCurrentCellStyle(                  
                      borderWidth: 2, borderColor: theme!.colorPrimary),
                  rowHoverColor: Colors.blue,
                  filterIconColor: Colors.white,                  
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
                  columnWidthMode: ColumnWidthMode.auto,
                  columnSizer: _customColumnSizer,
                  highlightRowOnHover: true,                            
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
                  footerHeight: 45,
                  footer: SizedBox(height: 45),
                  tableSummaryRows: [
                    GridTableSummaryRow(
                        position: GridTableSummaryRowPosition.bottom,
                        showSummaryInRow: false,
                        columns: [
                          GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'codigoPlaza',
                              summaryType: GridSummaryType.count),
                              ])]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  

}
