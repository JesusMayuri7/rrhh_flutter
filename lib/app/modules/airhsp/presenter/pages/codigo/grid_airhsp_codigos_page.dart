import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_codigo_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/bloc/codigo_bloc/airhsp_codigo_bloc.dart';
import 'package:rrhh_clean/core/uitls/theme/theme_custon.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'airhsp_codigo_datasource.dart';
import 'custom_column_sizer.dart';

class GridAirhspCodigoPage extends StatelessWidget {

  GridAirhspCodigoPage({
    required this.columns,
    required this.data,
    required this.keyGrid,
  });

final List<GridColumn> columns;
final List<AirhspCodigo> data;
final GlobalKey<SfDataGridState> keyGrid;
late CodigoAirhspDataSource airhspCodigoDataSource;
final airhspCodigoBloc = Modular.get<AirhspCodigoBloc>();

final CustomColumnSizer _customColumnSizer = CustomColumnSizer();

  @override
  Widget build(BuildContext context) {
  airhspCodigoDataSource = CodigoAirhspDataSource(listadoPresupuesto: this.data, context: context);
  airhspCodigoDataSource.buildDataGridRows();
  airhspCodigoDataSource.updateDataGrid();    
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
                  frozenColumnsCount: 1,
                  source: airhspCodigoDataSource,
                  headerRowHeight: 30,
                  rowHeight: 20,
                  isScrollbarAlwaysShown: true,
                  gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,                                   
                  selectionMode: SelectionMode.single,
                  navigationMode: GridNavigationMode.cell,
                  allowEditing: true,
                  columns: this.columns,      
                  onSelectionChanged: (addedRows, removedRows) {
                      final index = this.airhspCodigoDataSource.rows.indexOf(addedRows.last);
                      final AirhspCodigo airhspCodigoDetalle =airhspCodigoDataSource.listadoPresupuesto[index]; 
                      this.airhspCodigoBloc.add(SelectedCodigoEvent(airhspCodigo: airhspCodigoDetalle));
                  },           
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  

}
