import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/export_prac_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/bloc/list_prac_bloc.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/getColumnsListPrac.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/grid_prac_page.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;

import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

class ListPracPage extends StatefulWidget {
  ListPracPage({Key? key}) : super(key: key);

  @override
  _ListPracPageState createState() => _ListPracPageState();
}

class _ListPracPageState extends State<ListPracPage> {
  final GlobalKey<SfDataGridState> keyGrid = GlobalKey<SfDataGridState>();
  final textSearchController = TextEditingController();

  final bloc = Modular.get<ListPracBloc>();
  final String? anioSelected =
      Modular.get<AuthBloc>().state.loginResponseEntity?.anio;

  @override
  void initState() {
    if (this.bloc.state is ListPracLoaded) {
      if ((this.bloc.state as ListPracLoaded).listPracticanteOriginal.isEmpty)
        this.bloc.add(ListPracEvent(anio: anioSelected!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListPracBloc, ListPracState>(
      listener: (context, state) => {
        if (state is ErrorPracLoaded) {showToastError(context, state.message)}
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
                            this.bloc.add(ExportPracEvent(
                                paramsPracCalcular: ParamsPracCalcular(
                                    lista: (state is ListPracLoaded)
                                        ? state.listPracticanteOriginal
                                        : [],
                                    porcentajePrimaSctrPension: 0.35,
                                    porcentajeComisionSctrPension: 3,
                                    porcentajeIgv: 18,
                                    mesInicio: 0,
                                    mesFin: 11)));
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
                  Container(
                    width: 400,
                    child: TextFormField(
                        textDirection: TextDirection.rtl,
                        controller: textSearchController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          this.bloc.add(FilterPracEvent(textFilter: value));
                        },
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
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              if (state is ListPracLoaded)
                GridPracPage(
                  columns: getColumnsListPrac(context),
                  data: state.listPracticanteFiltered,
                  keyGrid: this.keyGrid,
                ),
              (state is ListPracLoading)
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
