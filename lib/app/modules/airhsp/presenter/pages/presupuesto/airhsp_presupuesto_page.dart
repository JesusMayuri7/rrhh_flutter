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

import 'bloc/airhsp_presupuesto_bloc.dart';
import 'getColumnsAirhspPresupuesto.dart';
import 'grid_airhsp_presupuesto_page.dart';

class ListAirhspPresupuestoPage extends StatefulWidget {
  ListAirhspPresupuestoPage({Key? key}) : super(key: key);

  @override
  _ListAirhspPresupuestoPageState createState() =>
      _ListAirhspPresupuestoPageState();
}

class _ListAirhspPresupuestoPageState extends State<ListAirhspPresupuestoPage> {
  final GlobalKey<SfDataGridState> keyGrid = GlobalKey<SfDataGridState>();
  final textSearchController = TextEditingController();

  final bloc = Modular.get<AirhspPresupuestoBloc>();
  final String? anioSelected = Modular.get<AppService>().sessionEntity?.anio;

  @override
  void initState() {
    if (this.bloc.state is AirhspPresupuestoLoaded) {
      if ((this.bloc.state as AirhspPresupuestoLoaded)
          .listPracticanteOriginal
          .isEmpty) {
        this.bloc.add(ListPracEvent(anio: anioSelected!));
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
                            this.bloc.add(ListPracEvent(anio: anioSelected!));
                          },
                          child: Text(
                            'Actualizar',
                            style: TextStyle(fontSize: 12),
                          )),
                      SizedBox(width: 5.0),
                      f.Button(
                          onPressed: () {
                            /*                     this.bloc.add(ExportPracEvent(
                                 paramsPracCalcular: ParamsPracCalcular(
                                    lista: (state is ListPracLoaded)
                                        ? state.listPracticanteOriginal
                                        : [],
                                    porcentajePrimaSctrPension: 0.35,
                                    porcentajeComisionSctrPension: 3,
                                    porcentajeIgv: 18,
                                    mesInicio: 0,
                                    mesFin: 11))); */
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
/*                   Container(
                    width: 400,
                    child: TextFormField(
                        textDirection: TextDirection.rtl,
                        controller: textSearchController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          prefixIcon: textSearchController.text.length > 0
                              ? Icon(Icons.close)
                              : Icon(Icons.search_outlined),
                          // set the prefix icon constraints
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 25,
                            minHeight: 25,
                          ),
                          border: OutlineInputBorder(),
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.only(
                              left: 5, top: 12, bottom: 0), // Added this
                        )),
                  ), */
                ],
              ),
              SizedBox(height: 5.0),
              if (state is AirhspPresupuestoLoaded)
                GridAirhspPresupuestoPage(
                  columns: getColumnsAirhspPresupuesto(context),
                  data: state.listPracticanteFiltered,
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
