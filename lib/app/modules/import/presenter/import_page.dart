import 'dart:io';

import 'package:excel/excel.dart';

import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/import/presenter/import_grid_datasource.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//import 'package:filepicker_windows/filepicker_windows.dart';

import 'getColumnsAll.dart';

import 'package:rrhh_clean/app/modules/import/presenter/bloc/import_bloc.dart';

/// Renders column type data grid
class ImportPage extends StatefulWidget {
  @override
  _JsonDataSourceDataGridState createState() => _JsonDataSourceDataGridState();
}

class _JsonDataSourceDataGridState extends State<ImportPage> {
  late ImportDataSource jsonDataGridSource;
  final bloc = Modular.get<ImportBloc>();

  List<String> headings = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImportBloc, ImportState>(
        listener: (context, state) {
          if (state is ImportFileLoaded) {
            f.showSnackbar(
              context,
              f.Snackbar(
                content: Text(state.message),
              ),
            );
/*             this.jsonDataGridSource.listado = state.list;
            this.jsonDataGridSource.buildDataGridRows();
            this.jsonDataGridSource.updateDataGrid(); */
          }
        },
        bloc: this.bloc,
        builder: (cpmtext, state) {
          return Column(children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      // openFile();
                    },
                    child: Text('Importar Documentos')),
              ],
            ),

            // CabeceraPage(),
            (state is ImportLoadingEvent)
                ? Center(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
            //footer(),
          ]);
        });
  }

  Expanded grid() {
    return Expanded(
        child: SfDataGridTheme(
      data: SfDataGridThemeData(
        brightness: Theme.of(context).brightness,
        headerHoverColor: Colors.white.withOpacity(0.3),
        headerColor: Colors.lightBlue[800],
      ),
      child: SfDataGrid(
          //columnWidthMode: ColumnWidthMode.fitByCellValue,
          source: this.jsonDataGridSource,
          isScrollbarAlwaysShown: true,
          headerRowHeight: 27,
          rowHeight: 22,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          allowSorting: true,
          allowMultiColumnSorting: true,
          allowTriStateSorting: true,
          showSortNumbers: true,
          columns: getColumnsAll(context, headings)),
    ));
  }

/*   void openFile() {
    if (Platform.isWindows) {
         final file = OpenFilePicker()
        ..filterSpecification = {
          'All Files': '*.*',
          'Xlsx Excel (*.xlsx)': '*.xlsx',
          'Xls (97-2003) (*.xls)': '*.xls',
        }
        ..defaultFilterIndex = 0
        //..defaultExtension = 'xls'
        ..title = 'Select a document';

      final result = file.getFile();
      //var FileData = MultipartFile.fromPath('file', file.)

      if (result != null) {
        //result.readAsBytes();
        //var bytes = result.readAsBytesSync();

        //var excel = Excel.decodeBytes(bytes);

        this.bloc.add(ImportLoadFile(bytes: result));
        //return result.;
      } 
    }
  } */

  List<List<Object>> importAIRHSP(Excel _excel) {
    List<List<Object>> dataList = [];
    for (var table in _excel.tables.keys) {
      var itemRow = 0;

      for (var row in _excel.tables[table]!.rows
          .sublist(3, _excel.tables[table]?.maxRows)) {
        List<String> listRow = [];
        for (var i = 0; i < row.length; i++) {
          String r = row[i]?.value.toString() ?? '';

          if (itemRow == 0) {
            if (headings.contains('FUENTE')) r = r + i.toString();
            headings.add(r.toString());
          } else
            listRow.add(r.toString());
        }
        if (itemRow > 0) dataList.add(listRow);
        itemRow++;
      }
    }
    return dataList;
  }

  List<List<Object>> importCertificado(Excel _excel) {
    List<List<Object>> dataList = [];
    for (var table in _excel.tables.keys) {
      var itemRow = 0;

      for (var row in _excel.tables[table]!.rows
          .sublist(3, _excel.tables[table]?.maxRows)) {
        List<String> listRow = [];
        for (var i = 0; i < row.length; i++) {
          String r = row[i]?.value.toString() ?? '';

          listRow.add(r.toString());
        }
        if (itemRow > 0) dataList.add(listRow);
        itemRow++;
      }
    }
    return dataList;
  }
}
