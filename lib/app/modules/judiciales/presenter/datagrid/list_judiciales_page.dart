import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import '../../../auth/presenter/bloc/auth_bloc.dart';
import '../../domain/judicial_entity.dart';
import '../bloc/list/judiciales_list_bloc.dart';
import 'getColumnsListJudiciales.dart';
import 'grid_judiciales_page.dart';
import 'list_judiciales_datasource.dart';
import 'new_judicial_page.dart';

class ListJudicialesPage extends StatefulWidget {
  ListJudicialesPage({Key? key}) : super(key: key);

  @override
  _ListJudicialesPageState createState() => _ListJudicialesPageState();
}

class _ListJudicialesPageState extends State<ListJudicialesPage> {
  final textSearchController = TextEditingController();

  final blocJudicial = Modular.get<JudicialesListBloc>();
  final String? anioSelected =
      Modular.get<AuthBloc>().state.loginResponseEntity?.anio;

  late ListJudicialesDataSource listJudicialesDataSource;

  @override
  void initState() {
    if (this.blocJudicial.state is JudicialesListInitial) {
      this.blocJudicial.add(JudicialesListLoad(anio: anioSelected!));
    }
    this.listJudicialesDataSource =
        ListJudicialesDataSource(listadoJudiciales: [], context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JudicialesListBloc, JudicialesListState>(
      listener: (context, state) {
        if (this.blocJudicial.state is JudicialesListError) {
          f.showSnackbar(
            context,
            f.Snackbar(
              content: Text('Error: no se puede listar! ' + state.toString()),
            ),
          );
        }
      },
      bloc: this.blocJudicial,
      builder: (context, state) {
        if (this.blocJudicial.state is JudicialesListLoaded) {
          this.listJudicialesDataSource.listadoJudiciales =
              (this.blocJudicial.state as JudicialesListLoaded)
                  .judicialesListFiltered;
          this.listJudicialesDataSource.buildDataGridRows();
          this.listJudicialesDataSource.updateDataGrid();
        }
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
                            this
                                .blocJudicial
                                .add(JudicialesListLoad(anio: anioSelected!));
                          },
                          child: Text(
                            'Actualizar',
                            style: TextStyle(fontSize: 12),
                          )),
                      SizedBox(width: 5.0),
                      f.Button(
                          onPressed: () {
                            //exportDataGridToExcel();
                            generateExcel((this.blocJudicial.state
                                    is JudicialesListLoaded)
                                ? (this.blocJudicial.state
                                        as JudicialesListLoaded)
                                    .judicialesListOriginal
                                : []);
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
                      f.Button(
                          onPressed: () {
                            _showModalDialog(context);
                          },
                          child: Text(
                            'Nuevo',
                            style: TextStyle(fontSize: 12),
                          )),
                      SizedBox(width: 5.0),
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
                          print('criterio ' + value);
                          this
                              .blocJudicial
                              .add(JudicialesListFilter(criterio: value));
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
              if (state is JudicialesListLoaded)
                GridJudicialesPage(
                  listJudicialesDataSource: this.listJudicialesDataSource,
                  columns: getColumnsListJudiciales(context),
                  data: state.judicialesListFiltered,
                ),
              (state is JudicialesListLoading)
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

/*   Future<void> exportDataGridToExcel() async {
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
    await FileSaveHelper.saveAndLaunchFile(bytes, 'Judiciales.xlsx');
  } */

  Future<void> generateExcel(List<JudicialEntity> listJudiciales) async {
// Create a new Excel Document.
    final Workbook workbook = Workbook();

// Accessing sheet via index.
    final Worksheet sheet = workbook.worksheets[0];

    for (int index = 0; index < listJudiciales.length; index++) {
      final List<Object> row =
          List.from(listJudiciales[index].toMap().values.toList());

      final List<Object> heading =
          List.from(listJudiciales[index].toMap().keys.toList());
      {
        if (index == 0) sheet.importList(heading, 1, 1, false);
      }

      sheet.importList(row, index + 2, 1, false);
    }

// Save and dispose workbook.
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await FileSaveHelper.saveAndLaunchFile(bytes, 'ListadoJudiciales.xlsx');
  }

  _showModalDialog(_context) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  height: 700,
                  width: 500,
                  child: NewJudicialPage(
                    judicialEntity: JudicialEntity.empty(),
                    contextJudicial: _context,
                  )));
        });
  }
}
