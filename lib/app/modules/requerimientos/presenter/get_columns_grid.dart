import 'package:fluent_ui/fluent_ui.dart';
import 'package:pluto_grid/pluto_grid.dart';

List<PlutoColumn> columns = [
  PlutoColumn(
    title: 'Id',
    field: 'id',
    width: 60,
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
    //type: PlutoColumnType.number(format: '0'),
  ),

  PlutoColumn(
    title: 'Año',
    field: 'anio',
    width: 60,
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
    //type: PlutoColumnType.number(format: '0'),
  ),
  PlutoColumn(
    width: 60,
    title: 'Modalidad',
    field: 'dsc_modalidad',
    type: PlutoColumnType.select(['CAS', 'CAP', 'PRAC']),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),

  /// Text Column definition
  PlutoColumn(
    width: 200,
    title: 'N° Exp. PVN',
    field: 'nro_expediente',
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),

  /// Datetime Column definition
  PlutoColumn(
    width: 300,
    title: 'N° Doc. Solic.',
    field: 'dcto_solicitud',
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),

  /// Time Column definition
  PlutoColumn(
    width: 250,
    title: 'Area',
    field: 'desc_area',
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),
  PlutoColumn(
    width: 100,
    title: 'Fecha',
    field: 'fecha_solicitud',
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),
];

List<PlutoColumn> columnsDetail = [
  PlutoColumn(
    title: 'Cantidad',
    field: 'cantidad',
    width: 60,
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
    //type: PlutoColumnType.number(format: '0'),
  ),
  PlutoColumn(
    width: 200,
    title: 'Sub. Area',
    field: 'desc_subarea',
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),

  PlutoColumn(
    width: 200,
    title: 'Cargo',
    field: 'cargo',
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),

  /// Text Column definition
  PlutoColumn(
    width: 80,
    title: 'monto',
    field: 'monto',
    type: PlutoColumnType.text(),
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    backgroundColor: Colors.blue,
  ),

  /// Datetime Column definition
];

/* List<PlutoRow> rows = [
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value1'),
      'number_field': PlutoCell(value: 2020),
      'select_field': PlutoCell(value: 'item1'),
      'date_field': PlutoCell(value: '2020-08-06'),
      'time_field': PlutoCell(value: '12:30'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value2'),
      'number_field': PlutoCell(value: 2021),
      'select_field': PlutoCell(value: 'item2'),
      'date_field': PlutoCell(value: '2020-08-07'),
      'time_field': PlutoCell(value: '18:45'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value3'),
      'number_field': PlutoCell(value: 2023),
      'select_field': PlutoCell(value: 'item3'),
      'date_field': PlutoCell(value: '2020-08-08'),
      'time_field': PlutoCell(value: '23:59'),
    },
  ),
]; */
