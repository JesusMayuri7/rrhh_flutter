import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'package:rrhh_clean/app/modules/documentos/presenter/bloc/list/documentos_list_bloc.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';

import '../../domain/documento_entity.dart';
import 'getColumnsListDocumentos.dart';
import 'grid_documentos_page.dart';
import 'new_documento_page.dart';

class ListDocumentosPage extends StatefulWidget {
  ListDocumentosPage({Key? key}) : super(key: key);

  @override
  _ListDocumentosPageState createState() => _ListDocumentosPageState();
}

class _ListDocumentosPageState extends State<ListDocumentosPage> {
  final GlobalKey<SfDataGridState> keyGrid = GlobalKey<SfDataGridState>();
  final textSearchController = TextEditingController();

  final bloc = Modular.get<DocumentosListBloc>();
  final String? anioSelected =
      Modular.get<AuthBloc>().state.loginResponseEntity?.anio;

  @override
  void initState() {
    if (this.bloc.state is DocumentosListInitial) {
      this.bloc.add(DocumentosListLoad(anio: anioSelected!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocumentosListBloc, DocumentosListState>(
      bloc: this.bloc,
      listener: (context, state) {
        if (this.bloc.state is DocumentosListError) {
          f.showSnackbar(context, SnackBar(content: Text('Error al listar')));
        }
      },
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
                            this
                                .bloc
                                .add(DocumentosListLoad(anio: anioSelected!));
                          },
                          child: Text(
                            'Actualizar',
                            style: TextStyle(fontSize: 12),
                          )),
                      SizedBox(width: 5.0),
                      f.Button(
                          onPressed: () {
                            exportDataGridToExcel();
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
                          //this.bloc.add(FilterPracEvent(textFilter: value));
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
              if (state is DocumentosListLoaded)
                GridDocumentosPage(
                  columns: getColumnsListDocumentos(context),
                  data: state.documentosList,
                  keyGrid: this.keyGrid,
                ),
              (state is DocumentosListLoading)
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

  _showModalDialog(_context) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 380,
                  height: 600,
                  child: NewDocumentoPage(
                    documentoEntity: DocumentoEntity(
                        anio: '2022',
                        asunto: '',
                        destino: '',
                        detalle: '',
                        estado: 'PENDIENTE',
                        expedientePvn: '',
                        expedienteMtc: '',
                        expedienteMef: '',
                        fecha: '',
                        id: 0,
                        numeroPvn: '',
                        remite: '',
                        tipo: 'OFICIO'),
                  )));
        });
  }
}
