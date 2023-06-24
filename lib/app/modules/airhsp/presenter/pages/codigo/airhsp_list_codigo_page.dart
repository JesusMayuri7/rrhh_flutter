import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_codigo_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/bloc/codigo_bloc/airhsp_codigo_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;

import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';


import 'getColumnsAirhspCodigo.dart';
import 'grid_airhsp_codigos_page.dart';


class AirhspListCodigoPage extends StatefulWidget {
  AirhspListCodigoPage({Key? key}) : super(key: key);

  @override
  _ListAirhspCodigoPageState createState() =>
      _ListAirhspCodigoPageState();
}

class _ListAirhspCodigoPageState extends State<AirhspListCodigoPage> {
  final GlobalKey<SfDataGridState> keyGrid = GlobalKey<SfDataGridState>();
  final textSearchController = TextEditingController();

  final bloc = Modular.get<AirhspCodigoBloc>();
  final String? anioSelected = Modular.get<AppService>().sessionEntity?.anio;
  String? selectedCombo = 'BASE';
 // ColumnsGridPresupuesto columnsGridPresupuesto = ColumnsGridPresupuesto(gratificacion: false, cts: false);

  @override
  void initState() {    
    this.bloc.add(LoadedCodigoEvent(paramsCodigo: ParamsCodigo(anio: anioSelected!,tipoPersona: 8)));          
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AirhspCodigoBloc, AirhspCodigoState>(
      listener: (context, state) => {
        if (state.statusCodigo == StatusCodigo.error)
          {showToastError(context, 'Error')}
      },
      bloc: this.bloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      fluentUi.Button(
                          onPressed: () {
                            
                           // this.bloc.add(ListPracEvent(anio: anioSelected!,bonificacion: false,cts: false,gratificacion: false));
                          },
                          child: Text(
                            'Actualizar',
                            style: TextStyle(fontSize: 12),
                          )),
                      SizedBox(width: 5.0),
                      fluentUi.Button(
                          onPressed: () {                           
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Exportar',
                                style: TextStyle(fontSize: 12),
                              ),
                              ImageIcon(
                                AssetImage('assets/images/ExcelExport.png'),
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.0),          
                       
                      GridAirhspCodigoPage(
                        columns: getColumnsAirhspCodigo(context),
                        data: state.codigos,
                        keyGrid: this.keyGrid,
                      ),                                        
            ],
          ),
        );
      },
    );
  }

  Future<void> exportDataGridToExcel() async {
    final Workbook workbook = keyGrid.currentState!.exportToExcelWorkbook(
        cellExport: (DataGridCellExcelExportDetails details) {
      if (details.cellType == DataGridExportCellType.columnHeader) {
        final bool isRightAlign = details.columnName == 'Product No' ||
            details.columnName == 'Shipped Date' ||
            details.columnName == 'Price';
        details.excelRange.cellStyle.hAlign =
            isRightAlign ? HAlignType.right : HAlignType.left;
      }
    });
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await FileSaveHelper.saveAndLaunchFile(bytes, 'BasePrac.xlsx');
  }
}
