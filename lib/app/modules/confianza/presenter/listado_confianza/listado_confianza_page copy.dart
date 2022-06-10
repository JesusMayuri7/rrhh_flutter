import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/area_entity.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../domain/entities/confianza_entity.dart';
import 'widgtes/getColumnsConfianza.dart';

import 'widgtes/confianza_datasource.dart';

class ListadoConfianzaPage extends StatefulWidget {
  const ListadoConfianzaPage(
      {Key? key, required this.listadoConfianza, required this.listadoAreas})
      : super(key: key);
  final List<ConfianzaEntity> listadoConfianza;
  final List<AreaEntity> listadoAreas;

  @override
  _ListadoConfianzaPageState createState() => _ListadoConfianzaPageState();
}

class _ListadoConfianzaPageState extends State<ListadoConfianzaPage> {
  late DataGridController dataGridController;
  late ConfianzaDataSource confianzaDataSource;

  @override
  void initState() {
    super.initState();
    dataGridController = DataGridController();

    this.confianzaDataSource = ConfianzaDataSource(
        context: context,
        listadoConfianza: widget.listadoConfianza,
        areas: widget.listadoAreas);
    this.confianzaDataSource.buildDataGridRows();
    this.confianzaDataSource.updateDataGrid();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SfDataGridTheme(
            data: SfDataGridThemeData(
              brightness: Theme.of(context).brightness,
              headerHoverColor: Colors.white.withOpacity(0.3),
              headerColor: Colors.lightBlue[800],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SfDataGrid(
                  footerFrozenColumnsCount: 1,
                  source: confianzaDataSource,
                  headerRowHeight: 25,
                  rowHeight: 25,
                  //isScrollbarAlwaysShown: true,
                  gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  allowSorting: true,
                  allowMultiColumnSorting: true,
                  allowTriStateSorting: true,
                  showSortNumbers: true,
                  columns: getColumnsConfianza(context)),
            )));
  }
}
