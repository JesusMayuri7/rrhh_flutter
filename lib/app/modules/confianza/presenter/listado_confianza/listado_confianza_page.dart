import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Row, Column;

import 'package:rrhh_clean/app/modules/confianza/domain/entities/confianza_entity.dart';
import 'package:rrhh_clean/app/modules/confianza/presenter/edit_confianza/edit_confianza_page.dart';
import 'package:rrhh_clean/app/modules/confianza/presenter/listado_confianza/widgtes/getColumnsConfianza.dart';

import 'bloc/list_confianza_bloc.dart';
import 'widgtes/confianza_datasource.dart';

class ListadoConfianzaPage extends StatefulWidget {
  ListadoConfianzaPage({Key? key}) : super(key: key);

  @override
  State<ListadoConfianzaPage> createState() => _ListadoConfianzaPageState();
}

class _ListadoConfianzaPageState extends State<ListadoConfianzaPage> {
  final blocConfianza = Modular.get<ListConfianzaBloc>();
  final String? anioSelected =
      Modular.get<AuthBloc>().state.loginResponseEntity?.anio;

  @override
  void initState() {
    if (blocConfianza.state is ListConfianzaBlocInitial) {
      this.blocConfianza.add(ListConfianzaEventGet(anio: anioSelected!));
    }
    super.initState();
  }
  //final List<ConfianzaEntity> listadoConfianza;

  final textSearchController = TextEditingController();

  //final DataGridController dataGridController = DataGridController();
  @override
  Widget build(BuildContext context) {
    ConfianzaDataSource confianzaDataSource =
        ConfianzaDataSource(context: context, listadoConfianza: [], areas: []);

    //blocList.add(ListConfianzaEventGet(anio: anioSelected!));

    return BlocConsumer<ListConfianzaBloc, ListConfianzaBlocState>(
      listener: (context, state) {
        if (state is ListConfianzaBlocError)
          showToastError(context, state.message);
/*         if (state is ListConfianzaBlocLoaded)
          showToastSuccess(context, 'Se agrego exitosamente'); */
      },
      bloc: this.blocConfianza,
      builder: (context, state) {
        if (state is ListConfianzaBlocLoaded) {
          confianzaDataSource.listadoConfianza = state.listConfianzaFiltered;
          confianzaDataSource.buildDataGridRows();
          confianzaDataSource.updateDataGrid();
        }
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            this.blocConfianza.add(
                                ListConfianzaEventGet(anio: anioSelected!));
                          },
                          child: Text('Actualizar')),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            generateExcel(confianzaDataSource.listadoConfianza);
                          },
                          child: Text('Exportar')),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _showModalDialog(
                            context,
                            ConfianzaEntity(
                                id: 0,
                                descArea: '',
                                cargo: '',
                                dni: '',
                                nombres: '',
                                inicio: '',
                                fin: '',
                                docDesignacion: '',
                                docCese: '',
                                direccion: '',
                                modalidad: 'CAP',
                                area_id: 0,
                                trabajadorId: 0,
                                detalle: '',
                                tipo: 'DESIGNACION',
                                plaza: '000000',
                                estado: ''));
                      },
                      child: Text('Nuevo')),
                  Container(
                    width: 400,
                    child: TextFormField(
                        textDirection: TextDirection.rtl,
                        controller: textSearchController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          this
                              .blocConfianza
                              .add(ListConfianzaEventFilter(textFilter: value));
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
              Expanded(
                  child: SfDataGridTheme(
                data: SfDataGridThemeData(
                  brightness: Theme.of(context).brightness,
                  headerHoverColor: Colors.white.withOpacity(0.3),
                  headerColor: Colors.lightBlue[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SfDataGrid(
                      highlightRowOnHover: true,
                      footerFrozenRowsCount: 0,
                      footerFrozenColumnsCount: 1,
                      frozenColumnsCount: 3,
                      source: confianzaDataSource,
                      headerRowHeight: 25,
                      rowHeight: 25,
                      isScrollbarAlwaysShown: true,
                      gridLinesVisibility: GridLinesVisibility.both,
                      headerGridLinesVisibility: GridLinesVisibility.both,
                      //allowSorting: true,
                      allowFiltering: true,
                      allowMultiColumnSorting: true,
                      allowTriStateSorting: true,
                      showSortNumbers: true,
                      selectionMode: SelectionMode.single,
                      columns: getColumnsConfianza(context)),
                ),
              )),
              if (state is ListConfianzaBlocLoading)
                CircularProgressIndicator(),
              if (state is ListConfianzaBlocError)
                ElevatedButton(
                    onPressed: () => this
                        .blocConfianza
                        .add(ListConfianzaEventGet(anio: anioSelected!)),
                    child: Text('Volver a cargar'))
            ],
          ),
        );
      },
    );
  }

  _showModalDialog(_context, ConfianzaEntity row) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 380,
                  height: 550,
                  child: EditConfianzaPage(
                    confianzaEntity: row,
                  )));
        });
  }

  Future<void> generateExcel(List<ConfianzaEntity> listConfianza) async {
// Create a new Excel Document.
    final Workbook workbook = Workbook();

// Accessing sheet via index.
    final Worksheet sheet = workbook.worksheets[0];

//Initialize the list
    //List<Object> listToExcel = [];
    for (int index = 0; index < listConfianza.length; index++) {
      final List<Object> row =
          List.from(listConfianza[index].toMap().values.toList());

      final List<Object> heading =
          List.from(listConfianza[index].toMap().keys.toList());
      //if (listConfianza[index].toMap().keys.toString() != 'certificado_id')
      {
        if (index == 0) sheet.importList(heading, 1, 1, false);
      }

      sheet.importList(row, index + 2, 1, false);
    }

// Save and dispose workbook.
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await FileSaveHelper.saveAndLaunchFile(bytes, 'ListadoConfianza.xlsx');
  }
}
