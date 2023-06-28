import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;

import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import '../presupuesto/bloc/airhsp_presupuesto_bloc.dart';
import 'getColumnsAirhspPresupuestoExt.dart';

import 'grid_airhsp_presupuesto_page_ext.dart';

class ListAirhspPresupuestoPageExt extends StatefulWidget {
  ListAirhspPresupuestoPageExt({Key? key}) : super(key: key);

  @override
  _ListAirhspPresupuestoPageState createState() =>
      _ListAirhspPresupuestoPageState();
}

class _ListAirhspPresupuestoPageState extends State<ListAirhspPresupuestoPageExt> {
  final GlobalKey<SfDataGridState> keyGrid = GlobalKey<SfDataGridState>();
  final textSearchController = TextEditingController();

  final bloc = Modular.get<AirhspPresupuestoBloc>();
  final String? anioSelected = Modular.get<AppService>().sessionEntity?.anio;
  String? selectedCombo = 'BASE';
 // ColumnsGridPresupuesto columnsGridPresupuesto = ColumnsGridPresupuesto(gratificacion: false, cts: false);

  @override
  void initState() {
    if (this.bloc.state is AirhspPresupuestoLoadedExt) {
      if ((this.bloc.state as AirhspPresupuestoLoadedExt)
          .listAirhspExtEntity.isEmpty) {
        this.bloc.add(ListAirhspExtEvent(anio: anioSelected!));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AirhspPresupuestoBloc, AirshpPresupuestoState>(
      listener: (context, state) => {
        if (state is AirhspPresupuestoError)
          {showToastError(context, state.message)}
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
                      f.Button(
                          onPressed: () {
                              this.bloc.add(ListAirhspExtEvent(anio: anioSelected!));                          
                          },
                          child: Text(
                            'Actualizar',
                            style: TextStyle(fontSize: 12),
                          )),
                      SizedBox(width: 5.0),
/*                         f.ComboBox<String>(
                        value: selectedCombo,
                        items: [f.ComboBoxItem(child: Text('Base AIRHSP'),value: 'BASE'),
                        f.ComboBoxItem(child: Text('AIRHSP Totales'),value: 'TOTALES',),
                        f.ComboBoxItem(child: Text('Calculo AIRHSP'),value: 'CALCULO',),                        
                        ],
                         onChanged: (value) {
                          this.selectedCombo = value;                                                                                                    
                         if(value == 'BASE'){                                                                                                                                 
                              this.bloc.add(ListPracEvent(anio: anioSelected!, bonificacion: false,cts: false,gratificacion: false));
                         }
                         if(value == 'TOTALES'){
                            this.bloc.add(TotalesAirhspEvent(bonificacion: true,cts: true,gratificacion: true));
                         }
                              if(value == 'CALCULO'){
                            this.bloc.add(CalculoAirhspEvent(bonificacion: true,cts: true,gratificacion: true));
                         }
                    },
                        ), */
                      SizedBox(width: 5.0),                                                
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.0),          
              if (state is AirhspPresupuestoLoadedExt)                        
                      GridAirhspPresupuestoPageExt(
                        columns: getColumnsAirhspPresupuestoExt(context,state.listAirhspExtEntity),  
                        data: state.listAirhspExtEntity,                      
                        keyGrid: this.keyGrid,
                      ),                                        
              (state is AirhspPresupuestoLoading)
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Cargando lista')
                      ],
                    ))
                  : Container()
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
