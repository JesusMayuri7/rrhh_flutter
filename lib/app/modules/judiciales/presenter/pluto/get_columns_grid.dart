import 'package:pluto_grid/pluto_grid.dart';

List<PlutoColumn> columns = [
  PlutoColumn(
    title: 'Tipo',
    field: 'tipo',
    type: PlutoColumnType.select(['OFICIO', 'MEMORAMDUN']),
  ),
  PlutoColumn(
    title: 'Año',
    field: 'anio',
    width: 60,
    enableSorting: false,
    enableFilterMenuItem: false,
    enableContextMenu: false,
    enableHideColumnMenuItem: false,
    enableSetColumnsMenuItem: false,
    type: PlutoColumnType.number(format: '0'),
  ),

  /// Text Column definition
  PlutoColumn(
    title: 'Remite',
    field: 'remite',
    type: PlutoColumnType.text(),
  ),

  PlutoColumn(
    title: 'Asunto',
    field: 'asunto',
    type: PlutoColumnType.text(),
  ),

  PlutoColumn(
    title: 'Expediente',
    field: 'expediente',
    type: PlutoColumnType.text(),
  ),

  /// Number Column definition

  /// Select Column definition

  PlutoColumn(
    title: 'Destino',
    field: 'destino',
    type: PlutoColumnType.text(),
  ),

  /// Datetime Column definition
  PlutoColumn(
    title: 'Fecha',
    field: 'fecha',
    type: PlutoColumnType.text(),
  ),
];
