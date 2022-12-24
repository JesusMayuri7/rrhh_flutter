import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

resumenSheet(Workbook _workbook, ParamsCalcular params, int _rowTotal) {
  final Worksheet sheet3 = _workbook.worksheets.addWithName('RESUMEN');
  sheet3.enableSheetCalculations();

  int firstRowHeadingResumen = 4;

  String mesInicio = _intToMesString(params.mesInicio + 1);

  List<Object> header = [
    'Fuente',
    'Producto',
    'Especifica',
    'PIM.',
    'Devengado',
    'CONCURSO',
    '',
    '',
    '',
    'TEMPORAL',
    '',
    '',
    '',
    'CONFIANZA',
    '',
    '',
    '',
    'Proyectado Total  $mesInicio-Dic',
    '',
    'Proyectado Total Ene-Dic'
        '',
    '',
    'Saldo'
  ];

  sheet3.importList(header, 2, 2, false);

  final Style headerStyle = _workbook.styles.add('Style1');
  //headerStyle.fontSize = 12;
  headerStyle.backColor = '#bbd5d0';
  headerStyle.bold = true;
  headerStyle.borders.all.lineStyle = LineStyle.thin;
  headerStyle.borders.all.color = '#000000';
  headerStyle.vAlign = VAlignType.center;
  headerStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('B2:D4').cellStyle = headerStyle;

  final Style pimDevengadoStyle = _workbook.styles.add('Style2');
  //pimDevengadoStyle.fontSize = 12;
  pimDevengadoStyle.backColor = '#b3dcd5';
  pimDevengadoStyle.bold = true;
  pimDevengadoStyle.borders.all.lineStyle = LineStyle.thin;
  pimDevengadoStyle.borders.all.color = '#000000';
  pimDevengadoStyle.vAlign = VAlignType.center;
  pimDevengadoStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('E2:F4').cellStyle = pimDevengadoStyle;

  final Style fuenteStyle = _workbook.styles.add('Style3');
  //fuenteStyle.fontSize = 12;
  fuenteStyle.backColor = '#B7D6C3';
  fuenteStyle.bold = true;
  fuenteStyle.borders.all.lineStyle = LineStyle.thin;
  fuenteStyle.borders.all.color = '#000000';
  //fuenteStyle.vAlign = VAlignType.center;
  //fuenteStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('B6:W6').cellStyle = fuenteStyle;
  sheet3.getRangeByName('B17:W17').cellStyle = fuenteStyle;

  final Style productoStyle = _workbook.styles.add('Style4');
  //productoStyle.fontSize = 12;
  productoStyle.backColor = '#eee24f';
  productoStyle.bold = true;
  productoStyle.borders.all.lineStyle = LineStyle.thin;
  productoStyle.borders.all.color = '#000000';
  //productoStyle.vAlign = VAlignType.center;
  //productoStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('B7:W7').cellStyle = productoStyle;
  sheet3.getRangeByName('B12:W12').cellStyle = productoStyle;
  sheet3.getRangeByName('B18:W18').cellStyle = productoStyle;
  sheet3.getRangeByName('B23:W23').cellStyle = productoStyle;

  // CONCURSO
  final Style concursoStyle = _workbook.styles.add('concursoStyle');
  concursoStyle.backColor = '#ffd08e';
  concursoStyle.bold = true;
  concursoStyle.borders.all.lineStyle = LineStyle.thin;
  concursoStyle.borders.all.color = '#000000';
  concursoStyle.vAlign = VAlignType.center;
  concursoStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('G2:J4').cellStyle = concursoStyle;

  //TEMPORAL
  final Style temporalStyle = _workbook.styles.add('temporalStyle');
  temporalStyle.backColor = '#33FFF6';
  temporalStyle.bold = true;
  temporalStyle.borders.all.lineStyle = LineStyle.thin;
  temporalStyle.borders.all.color = '#000000';
  temporalStyle.vAlign = VAlignType.center;
  temporalStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('K2:N4').cellStyle = temporalStyle;

  //CONFIANZA
  final Style confianzaStyle = _workbook.styles.add('confianzaStyle');
  confianzaStyle.backColor = '#FFB233';
  confianzaStyle.bold = true;
  confianzaStyle.borders.all.lineStyle = LineStyle.thin;
  confianzaStyle.borders.all.color = '#000000';
  confianzaStyle.vAlign = VAlignType.center;
  confianzaStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('O2:R4').cellStyle = confianzaStyle;

  // TOTAL PROYECTADO
  final Style totalProyectadoStyle =
      _workbook.styles.add('totalProyectadoStyle');
  totalProyectadoStyle.wrapText = true;
  totalProyectadoStyle.backColor = '#c9ffff';
  totalProyectadoStyle.bold = true;
  totalProyectadoStyle.borders.all.lineStyle = LineStyle.thin;
  totalProyectadoStyle.borders.all.color = '#000000';
  totalProyectadoStyle.vAlign = VAlignType.center;
  totalProyectadoStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('S2:T4').cellStyle = totalProyectadoStyle;

  final Style totalEneDicStyle = _workbook.styles.add('Style7');
  totalEneDicStyle.wrapText = true;
  totalEneDicStyle.backColor = '#8EFFF5';
  totalEneDicStyle.bold = true;
  totalEneDicStyle.borders.all.lineStyle = LineStyle.thin;
  totalEneDicStyle.borders.all.color = '#000000';
  totalEneDicStyle.vAlign = VAlignType.center;
  totalEneDicStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('U2:V4').cellStyle = totalEneDicStyle;

  final Style totalesStyle = _workbook.styles.add('Style8');
  //totalesStyle.fontSize = 12;
  totalesStyle.backColor = '#FFBD8E';
  totalesStyle.bold = true;
  totalesStyle.borders.all.lineStyle = LineStyle.thin;
  totalesStyle.borders.all.color = '#000000';
  //totalesStyle.vAlign = VAlignType.center;
  //totalesStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('B28:W28').cellStyle = totalesStyle;

  final Style saldosStyle = _workbook.styles.add('Style9');
  //saldosStyle.fontSize = 12;
  saldosStyle.backColor = '#f3bb93';
  saldosStyle.bold = true;
  saldosStyle.borders.all.lineStyle = LineStyle.thin;
  saldosStyle.borders.all.color = '#000000';
  saldosStyle.vAlign = VAlignType.center;
  saldosStyle.hAlign = HAlignType.center;
  sheet3.getRangeByName('W2:W4').cellStyle = saldosStyle;

  //sheet3.importList(header, (firstRowHeadingResumen - 3), 2, false);
  //mergue

  sheet3.getRangeByName('B2:B4').merge();
  sheet3.getRangeByName('C2:C4').merge();
  sheet3.getRangeByName('D2:D4').merge();
  sheet3.getRangeByName('E2:E4').merge();
  sheet3.getRangeByName('F2:F4').merge();

  //sheet3.getRangeByName('B3:M5').cellStyle.backColor = '#93D2D6';
  sheet3.getRangeByName('B2:W4').cellStyle.borders.all.lineStyle =
      LineStyle.medium;
  sheet3.getRangeByName('B2:W4').cellStyle.borders.all.color = '#000000';

  List<List<Object>> dataResumen = [
    [
      '',
      '',
      '',
      '',
      '',
      'Cant.',
      'Proyectado',
      'Cant.',
      'Proyectado',
      'Cant.',
      'Proyectado',
      'Cant.',
      'Proyectado',
      'Cant.',
      'Proyectado',
      'Cant.',
      'Proyectado',
      'Cant.',
      'Proyectado',
      'Cant.',
      'Proyectado',
      ''
    ],
    [
      '',
      '',
      '',
      '(A)',
      '(B)',
      '(C)',
      '',
      '(D)',
      '',
      '(E) = ( C + D )',
      '',
      '(F) = ( B + E )',
      '',
      '(G) = ( A - F )',
    ],
    ['RO', '', '', 0, 0],
    ['RO', '3000001. ACCIONES COMUNES', '', 0, 0],
    [
      'RO',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  1  CONTRATO ADMINISTRATIVO DE SERVICIOS',
      0,
      0
    ],
    [
      'RO',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  2  CONTRIBUCIONES A ESSALUD DE C.A.S.',
      0,
      0
    ],
    [
      'RO',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  4  AGUINALDOS DE C.A.S.',
      0,
      0
    ],
    [
      'RO',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  5  VACACIONES TRUNCAS DE C.A.S.',
      0,
      0
    ],
    ['RO', '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL', '', 0, 0],
    [
      'RO',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  1  CONTRATO ADMINISTRATIVO DE SERVICIOS',
      0,
      0
    ],
    [
      'RO',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  2  CONTRIBUCIONES A ESSALUD DE C.A.S.',
      0,
      0
    ],
    [
      'RO',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  4  AGUINALDOS DE C.A.S.',
      0,
      0
    ],
    [
      'RO',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  5  VACACIONES TRUNCAS DE C.A.S.',
      0,
      0
    ],
    ['RDR', '', '', 0, 0],
    ['RDR', '3000001. ACCIONES COMUNES', '', 0, 0],
    [
      'RDR',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  1  CONTRATO ADMINISTRATIVO DE SERVICIOS',
      0,
      0
    ],
    [
      'RDR',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  2  CONTRIBUCIONES A ESSALUD DE C.A.S.',
      0,
      0
    ],
    [
      'RDR',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  4  AGUINALDOS DE C.A.S.',
      0,
      0
    ],
    [
      'RDR',
      '3000001. ACCIONES COMUNES',
      '2.3. 2  8. 1  5  VACACIONES TRUNCAS DE C.A.S.',
      0,
      0
    ],
    ['RDR', '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL', '', 0, 0],
    [
      'RDR',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  1  CONTRATO ADMINISTRATIVO DE SERVICIOS',
      0,
      0
    ],
    [
      'RDR',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  2  CONTRIBUCIONES A ESSALUD DE C.A.S.',
      0,
      0
    ],
    [
      'RDR',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  4  AGUINALDOS DE C.A.S.',
      0,
      0
    ],
    [
      'RDR',
      '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL',
      '2.3. 2  8. 1  5  VACACIONES TRUNCAS DE C.A.S.',
      0,
      0
    ],
  ];

  for (int rowDataResumen = 0;
      rowDataResumen < dataResumen.length;
      rowDataResumen++) {
    final List<Object> row = dataResumen[rowDataResumen];

    sheet3.importList(row, (rowDataResumen + firstRowHeadingResumen), 2, false);
  }

  _buildPimDevengado(sheet3);

  // Condicion OCUPADOS Y VACANTES
  _buildProyeccionCas(sheet3, _rowTotal);

  // Total Proyeccion
  sheet3.getRangeByName('S2:T3').merge();
  _buildTotalProyeccionCasCalc(
      sheet3: sheet3,
      rowTotal: _rowTotal,
      columnaCantidad: 'S',
      columnaMonto: 'T',
      columnasCantidadesASumar: ['G', 'I', 'K', 'M', 'O', 'Q'],
      columnasMontosOperacion: ['H', 'J', 'L', 'N', 'P', 'R'],
      filaResumenInicio: 6);

  // Total Anual
  sheet3.getRangeByName('U2:V3').merge();
  _buildTotalProyeccionCasCalc(
      sheet3: sheet3,
      rowTotal: _rowTotal,
      columnaCantidad: 'U',
      columnaMonto: 'V',
      columnasCantidadesASumar: ['S'],
      columnasMontosOperacion: ['F', 'T'],
      filaResumenInicio: 6);

  // Saldo Anual
  sheet3.getRangeByName('W2:W4').merge();
  _buildTotalProyeccionCasCalc(
      sheet3: sheet3,
      rowTotal: _rowTotal,
      columnaMonto: 'W',
      columnasMontosOperacion: ['E', 'V'],
      filaResumenInicio: 6,
      operacion: '-');

  sheet3.getRangeByName('C8:W28').autoFitColumns();
}

void _buildTotalProyeccionCasCalc(
    {required Worksheet sheet3,
    required int rowTotal,
    String columnaCantidad = '',
    required String columnaMonto,
    required int filaResumenInicio,
    String operacion = '+',
    List<String> columnasCantidadesASumar = const [],
    required List<String> columnasMontosOperacion}) {
  //TOTAL PROYECCION
  if (columnasCantidadesASumar.isNotEmpty) {
    sheet3.getRangeByName('$columnaCantidad$filaResumenInicio').formula =
        '=$columnaCantidad${filaResumenInicio + 1}+$columnaCantidad${filaResumenInicio + 6}';
    sheet3.getRangeByName('$columnaCantidad$filaResumenInicio').numberFormat =
        '0';
    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 1}').formula =
        '=$columnaCantidad${filaResumenInicio + 2}';
    //Columnas a Sumar
    //sb.writeAll(columnasCantidadesASumar, '${filaResumenInicio + 2}+ ');
    ///sb.write('${filaResumenInicio + 2}');
    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 2}').formula =
        sumatoriaColumnas(columnasCantidadesASumar, 2, 6, operacion);

    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 6}').formula =
        '=$columnaCantidad${filaResumenInicio + 7}';

    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 7}').formula =
        sumatoriaColumnas(columnasCantidadesASumar, 7, 6, operacion);

    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 11}').formula =
        '=$columnaCantidad${filaResumenInicio + 12}+$columnaCantidad${filaResumenInicio + 17}';
    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 12}').formula =
        '=$columnaCantidad${filaResumenInicio + 13}';

    //Columnas a Sumar

    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 13}').formula =
        sumatoriaColumnas(columnasCantidadesASumar, 13, 6, operacion);

    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 17}').formula =
        '=$columnaCantidad${filaResumenInicio + 18}';

    //Columnas a Sumar

    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 18}').formula =
        sumatoriaColumnas(columnasCantidadesASumar, 18, 6, operacion);
    sheet3.getRangeByName('$columnaCantidad${filaResumenInicio + 22}').formula =
        '=$columnaCantidad$filaResumenInicio+$columnaCantidad${filaResumenInicio + 11}';
    sheet3
        .getRangeByName(
            '$columnaCantidad$filaResumenInicio:$columnaCantidad${filaResumenInicio + 22}')
        .numberFormat = '0';
  }

  // Montos Totales

  sheet3.getRangeByName('$columnaMonto$filaResumenInicio').formula =
      '=$columnaMonto${filaResumenInicio + 1}+$columnaMonto${filaResumenInicio + 6}';

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 1}').formula =
      '=SUM($columnaMonto${filaResumenInicio + 2}:$columnaMonto${filaResumenInicio + 5})';

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 2}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 2, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 3}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 3, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 4}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 4, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 5}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 5, 6, operacion);

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 6}').formula =
      '=SUM($columnaMonto${filaResumenInicio + 7}:$columnaMonto${filaResumenInicio + 10})';
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 7}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 7, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 8}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 8, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 9}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 9, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 10}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 10, 6, operacion);

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 11}').formula =
      '=$columnaMonto${filaResumenInicio + 12}+$columnaMonto${filaResumenInicio + 17}';

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 12}').formula =
      '=SUM($columnaMonto${filaResumenInicio + 13}:$columnaMonto${filaResumenInicio + 16})';

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 13}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 13, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 14}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 14, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 15}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 15, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 16}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 16, 6, operacion);

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 17}').formula =
      '=SUM($columnaMonto${filaResumenInicio + 18}:$columnaMonto${filaResumenInicio + 21})';
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 18}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 18, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 19}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 19, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 20}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 20, 6, operacion);
  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 21}').formula =
      sumatoriaColumnas(columnasMontosOperacion, 21, 6, operacion);

  sheet3.getRangeByName('$columnaMonto${filaResumenInicio + 22}').formula =
      '=$columnaMonto$filaResumenInicio+$columnaMonto${filaResumenInicio + 11}';

  sheet3
      .getRangeByName(
          '$columnaMonto$filaResumenInicio:$columnaMonto${filaResumenInicio + 22}')
      .numberFormat = '#,##0.00';
}

void _buildProyeccionCas(Worksheet sheet3, int rowTotal) {
  //CONCURSO
  sheet3.getRangeByName('G2:J2').merge();
  sheet3.getRangeByName('G3:H3').merge();
  sheet3.getRangeByName('I3:J3').merge();
  //TEMPORAL
  sheet3.getRangeByName('K2:N2').merge();
  sheet3.getRangeByName('K3:L3').merge();
  sheet3.getRangeByName('M3:N3').merge();
  //CONFIANZA
  sheet3.getRangeByName('O2:R2').merge();
  sheet3.getRangeByName('O3:P3').merge();
  sheet3.getRangeByName('Q3:R3').merge();

/*
  sheet3.getRangeByName('K2:N3').merge();
  sheet3.getRangeByName('M2:N3').merge();
  sheet3.getRangeByName('M5:N5').merge();
  sheet3.getRangeByName('G5:H5').merge();
  sheet3.getRangeByName('I5:J5').merge();
  sheet3.getRangeByName('K5:L5').merge();
  sheet3.getRangeByName('O2:O4').merge();
*/
  // Cantidades
  // CONCURSO
  _cantidades(
      columnaResumenCantidad: 'G',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      celdaResumenModalidad: 'G2',
      columnaBaseEstado: 'N',
      celdaResumenEstado: 'G3',
      estado: 'OCUPADO',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  // Montos Totales -- OCUPADO
  //RO
  _montos(
      columnaResumenMonto: 'H',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      columnaBaseEstado: 'N',
      columnaBaseSueldo: 'Z',
      columnaBaseEssalud: 'AA',
      columnaBaseAguinaldo: 'AB',
      celdaResumenEstado: 'G',
      celdaResumenModalidad: 'G2',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  _cantidades(
      columnaResumenCantidad: 'I',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      celdaResumenModalidad: 'G2',
      columnaBaseEstado: 'N',
      columnaBaseModalidad: 'L',
      celdaResumenEstado: 'I3',
      estado: 'VACANTE',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);
  _montos(
      columnaResumenMonto: 'J',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      columnaBaseEstado: 'N',
      columnaBaseSueldo: 'Z',
      columnaBaseEssalud: 'AA',
      columnaBaseAguinaldo: 'AB',
      celdaResumenEstado: 'I',
      celdaResumenModalidad: 'G2',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  // Cantidades
  // TEMPORAL
  _cantidades(
      columnaResumenCantidad: 'K',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      celdaResumenModalidad: 'K2',
      columnaBaseEstado: 'N',
      celdaResumenEstado: 'K3',
      estado: 'OCUPADO',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  // Montos Totales -- OCUPADO
  //RO
  _montos(
      columnaResumenMonto: 'L',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      columnaBaseEstado: 'N',
      columnaBaseSueldo: 'Z',
      columnaBaseEssalud: 'AA',
      columnaBaseAguinaldo: 'AB',
      celdaResumenEstado: 'K',
      celdaResumenModalidad: 'K2',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  _cantidades(
      columnaResumenCantidad: 'M',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      celdaResumenModalidad: 'K2',
      columnaBaseEstado: 'N',
      columnaBaseModalidad: 'L',
      celdaResumenEstado: 'M3',
      estado: 'VACANTE',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);
  _montos(
      columnaResumenMonto: 'N',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      columnaBaseEstado: 'N',
      columnaBaseSueldo: 'Z',
      columnaBaseEssalud: 'AA',
      columnaBaseAguinaldo: 'AB',
      celdaResumenEstado: 'M',
      celdaResumenModalidad: 'K2',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  // Cantidades
  // CONFIANZA
  _cantidades(
      columnaResumenCantidad: 'O',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      celdaResumenModalidad: 'O2',
      columnaBaseEstado: 'N',
      celdaResumenEstado: 'O3',
      estado: 'OCUPADO',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  // Montos Totales -- OCUPADO
  //RO
  _montos(
      columnaResumenMonto: 'P',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      columnaBaseEstado: 'N',
      columnaBaseSueldo: 'Z',
      columnaBaseEssalud: 'AA',
      columnaBaseAguinaldo: 'AB',
      celdaResumenEstado: 'O',
      celdaResumenModalidad: 'O2',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);

  _cantidades(
      columnaResumenCantidad: 'Q',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      celdaResumenModalidad: 'O2',
      columnaBaseEstado: 'N',
      columnaBaseModalidad: 'L',
      celdaResumenEstado: 'Q3',
      estado: 'VACANTE',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);
  _montos(
      columnaResumenMonto: 'R',
      columnaBaseFuente: 'F',
      columnaBaseProducto: 'C',
      columnaResumenFuente: 'B',
      columnaResumenProducto: 'C',
      columnaBaseModalidad: 'L',
      columnaBaseEstado: 'N',
      columnaBaseSueldo: 'Z',
      columnaBaseEssalud: 'AA',
      columnaBaseAguinaldo: 'AB',
      celdaResumenEstado: 'Q',
      celdaResumenModalidad: 'O2',
      filaBaseInicio: 6,
      filaResumenInicio: 6,
      sheet3: sheet3,
      rowTotal: rowTotal);
}

void _buildPimDevengado(Worksheet sheet3) {
  //PIM
  sheet3.getRangeByIndex(6, 5).formula = '=E7+E12';
  sheet3.getRangeByIndex(7, 5).formula = '=SUM(E8:E11)';

  sheet3.getRangeByIndex(8, 5).formula = '=PRESUPUESTO!F6';
  sheet3.getRangeByIndex(9, 5).formula = '=PRESUPUESTO!F7';
  sheet3.getRangeByIndex(10, 5).formula = '=PRESUPUESTO!F8';
  sheet3.getRangeByIndex(11, 5).formula = '=PRESUPUESTO!F9';

  sheet3.getRangeByIndex(12, 5).formula = '=SUM(E13:E16)';
  sheet3.getRangeByIndex(13, 5).formula = '=PRESUPUESTO!F10';
  sheet3.getRangeByIndex(14, 5).formula = '=PRESUPUESTO!F11';
  sheet3.getRangeByIndex(15, 5).formula = '=PRESUPUESTO!F12';
  sheet3.getRangeByIndex(16, 5).formula = '=PRESUPUESTO!F13';

  sheet3.getRangeByIndex(17, 5).formula = '=E18+E23';
  sheet3.getRangeByIndex(18, 5).formula = '=SUM(E19:E22)';
  sheet3.getRangeByIndex(19, 5).formula = '=PRESUPUESTO!F14';
  sheet3.getRangeByIndex(20, 5).formula = '=PRESUPUESTO!F15';
  sheet3.getRangeByIndex(21, 5).formula = '=PRESUPUESTO!F16';
  sheet3.getRangeByIndex(22, 5).formula = '=PRESUPUESTO!F17';

  sheet3.getRangeByIndex(23, 5).formula = '=SUM(E24:E27)';
  sheet3.getRangeByIndex(24, 5).formula = '=PRESUPUESTO!F18';
  sheet3.getRangeByIndex(25, 5).formula = '=PRESUPUESTO!F19';
  sheet3.getRangeByIndex(26, 5).formula = '=PRESUPUESTO!F20';
  sheet3.getRangeByIndex(27, 5).formula = '=PRESUPUESTO!F21';

  // DEVENGADO
  sheet3.getRangeByIndex(28, 5).formula = '=E6+E17';

  sheet3.getRangeByIndex(6, 6).formula = '=F7+F12';
  sheet3.getRangeByIndex(7, 6).formula = '=SUM(F8:F11)';
  sheet3.getRangeByIndex(8, 6).formula = '=PRESUPUESTO!H6';
  sheet3.getRangeByIndex(9, 6).formula = '=PRESUPUESTO!H7';
  sheet3.getRangeByIndex(10, 6).formula = '=PRESUPUESTO!H8';
  sheet3.getRangeByIndex(11, 6).formula = '=PRESUPUESTO!H9';

  sheet3.getRangeByIndex(12, 6).formula = '=SUM(F13:F16)';
  sheet3.getRangeByIndex(13, 6).formula = '=PRESUPUESTO!H10';
  sheet3.getRangeByIndex(14, 6).formula = '=PRESUPUESTO!H11';
  sheet3.getRangeByIndex(15, 6).formula = '=PRESUPUESTO!H12';
  sheet3.getRangeByIndex(16, 6).formula = '=PRESUPUESTO!H13';

  sheet3.getRangeByIndex(17, 6).formula = '=F18+F23';
  sheet3.getRangeByIndex(18, 6).formula = '=SUM(F19:F22)';
  sheet3.getRangeByIndex(19, 6).formula = '=PRESUPUESTO!H14';
  sheet3.getRangeByIndex(20, 6).formula = '=PRESUPUESTO!H15';
  sheet3.getRangeByIndex(21, 6).formula = '=PRESUPUESTO!H16';
  sheet3.getRangeByIndex(22, 6).formula = '=PRESUPUESTO!H17';

  sheet3.getRangeByIndex(23, 6).formula = '=SUM(F24:F27)';
  sheet3.getRangeByIndex(24, 6).formula = '=PRESUPUESTO!H18';
  sheet3.getRangeByIndex(25, 6).formula = '=PRESUPUESTO!H19';
  sheet3.getRangeByIndex(26, 6).formula = '=PRESUPUESTO!H20';
  sheet3.getRangeByIndex(27, 6).formula = '=PRESUPUESTO!H21';

  sheet3.getRangeByIndex(28, 6).formula = '=F6+F17';

  sheet3.getRangeByName('E6:F28').numberFormat = '#,##0.00';
}

String sumatoriaColumnas(List<String> columnas, int filasAdicional,
    int filaResumenInicio, String operacion) {
  final sb = StringBuffer();
  if (columnas.length > 0)
    sb.writeAll(columnas, '${filaResumenInicio + filasAdicional}$operacion');
  sb.write('${filaResumenInicio + filasAdicional}');
  return sb.toString();
}

String _intToMesString(int mes) {
  switch (mes) {
    case 1:
      return 'Ene';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Abr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Ago';
    case 9:
      return 'Set';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dic';
    default:
      return 'Ninguno';
  }
}

// Cantidades
void _cantidades(
    {required String columnaResumenCantidad,
    required String columnaResumenFuente,
    required String columnaResumenProducto,
    required String columnaBaseFuente,
    required String columnaBaseProducto,
    required String columnaBaseEstado,
    required String columnaBaseModalidad,
    required String celdaResumenEstado,
    required String celdaResumenModalidad,
    required String estado,
    required int filaBaseInicio,
    required int filaResumenInicio,
    required Worksheet sheet3,
    required int rowTotal}) {
  sheet3.getRangeByName('$celdaResumenEstado').setText('$estado');
  //RO
  sheet3
          .getRangeByName(
              '${columnaResumenCantidad + filaResumenInicio.toString()}')
          .formula =
      '=$columnaResumenCantidad${filaResumenInicio + 1}+$columnaResumenCantidad${filaResumenInicio + 6}';

  sheet3
      .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 1}')
      .formula = '=$columnaResumenCantidad${filaResumenInicio + 2}';

  sheet3
          .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 2}')
          .formula =
      '=COUNTIFS(BASE!$columnaBaseFuente$filaBaseInicio:$columnaBaseFuente$rowTotal,$columnaResumenFuente${filaResumenInicio + 2},BASE!$columnaBaseProducto$filaBaseInicio:$columnaBaseProducto$rowTotal,$columnaResumenProducto${(filaResumenInicio + 2)},BASE!$columnaBaseEstado$filaBaseInicio:N$rowTotal,\$$columnaResumenCantidad\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';

  sheet3
      .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 6}')
      .formula = '=$columnaResumenCantidad${filaResumenInicio + 7}';

  sheet3
          .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 7}')
          .formula =
      '=COUNTIFS(BASE!$columnaBaseFuente$filaBaseInicio:$columnaBaseFuente$rowTotal,$columnaResumenFuente${filaResumenInicio + 7},BASE!$columnaBaseProducto$filaBaseInicio:$columnaBaseProducto$rowTotal,$columnaResumenProducto${(filaResumenInicio + 7)},BASE!$columnaBaseEstado$filaBaseInicio:N$rowTotal,\$$columnaResumenCantidad\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';

// RDR
  sheet3
          .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 11}')
          .formula =
      '=$columnaResumenCantidad${filaResumenInicio + 12}+$columnaResumenCantidad${filaResumenInicio + 17}';

  sheet3
      .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 12}')
      .formula = '=$columnaResumenCantidad${filaResumenInicio + 13}';

  sheet3
          .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 13}')
          .formula =
      '=COUNTIFS(BASE!$columnaBaseFuente$filaBaseInicio:$columnaBaseFuente$rowTotal,$columnaResumenFuente${filaResumenInicio + 13},BASE!$columnaBaseProducto$filaBaseInicio:$columnaBaseProducto$rowTotal,$columnaResumenProducto${(filaResumenInicio + 13)},BASE!$columnaBaseEstado$filaBaseInicio:N$rowTotal,\$$columnaResumenCantidad\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';

  sheet3
      .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 17}')
      .formula = '=$columnaResumenCantidad${filaResumenInicio + 18}';

  sheet3
          .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 18}')
          .formula =
      '=COUNTIFS(BASE!$columnaBaseFuente$filaBaseInicio:$columnaBaseFuente$rowTotal,$columnaResumenFuente${filaResumenInicio + 18},BASE!$columnaBaseProducto$filaBaseInicio:$columnaBaseProducto$rowTotal,$columnaResumenProducto${(filaResumenInicio + 18)},BASE!$columnaBaseEstado$filaBaseInicio:N$rowTotal,\$$columnaResumenCantidad\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';

  sheet3
          .getRangeByName('$columnaResumenCantidad${filaResumenInicio + 22}')
          .formula =
      '=$columnaResumenCantidad$filaResumenInicio+$columnaResumenCantidad${filaResumenInicio + 11}';
  sheet3
      .getRangeByName('$columnaResumenCantidad$filaResumenInicio')
      .numberFormat = '0';
}

void _montos(
    {required String columnaResumenMonto,
    required String columnaBaseModalidad,
    required String columnaBaseFuente,
    required String columnaBaseProducto,
    required String columnaResumenFuente,
    required String columnaResumenProducto,
    required String columnaBaseEstado,
    required String columnaBaseSueldo,
    required String columnaBaseEssalud,
    required String columnaBaseAguinaldo,
    required String celdaResumenEstado,
    required String celdaResumenModalidad,
    required int filaBaseInicio,
    required int filaResumenInicio,
    required Worksheet sheet3,
    required int rowTotal}) {
  //RO
  sheet3.getRangeByName('$columnaResumenMonto$filaResumenInicio').formula =
      '=$columnaResumenMonto${filaResumenInicio + 1}+$columnaResumenMonto${filaResumenInicio + 6}';
  // ACCIONES COMUNES
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 1}')
          .formula =
      '=SUM($columnaResumenMonto${filaResumenInicio + 2}:$columnaResumenMonto${filaResumenInicio + 5})';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 2}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseSueldo\$$filaBaseInicio:\$$columnaBaseSueldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 2},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 2},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 3}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseEssalud\$$filaBaseInicio:\$$columnaBaseEssalud\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 3},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 3},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 4}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseAguinaldo\$$filaBaseInicio:\$$columnaBaseAguinaldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 4},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 4},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  //CAMINO NACIONAL
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 6}')
          .formula =
      '=SUM($columnaResumenMonto${filaResumenInicio + 7}:$columnaResumenMonto${filaResumenInicio + 10})';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 7}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseSueldo\$$filaBaseInicio:\$$columnaBaseSueldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 7},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 7},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 8}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseEssalud\$$filaBaseInicio:\$$columnaBaseEssalud\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 8},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 8},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 9}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseAguinaldo\$$filaBaseInicio:\$$columnaBaseAguinaldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 9},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 9},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';

  sheet3.getRangeByName('$columnaResumenMonto$filaResumenInicio').formula =
      '=$columnaResumenMonto${filaResumenInicio + 1}+$columnaResumenMonto${filaResumenInicio + 6}';

  //RDR
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 11}')
          .formula =
      '=$columnaResumenMonto${filaResumenInicio + 12}+$columnaResumenMonto${filaResumenInicio + 17}';
  // ACCIONES COMUNES
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 12}')
          .formula =
      '=SUM($columnaResumenMonto${filaResumenInicio + 13}:$columnaResumenMonto${filaResumenInicio + 16})';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 13}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseSueldo\$$filaBaseInicio:\$$columnaBaseSueldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 13},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 13},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 14}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseEssalud\$$filaBaseInicio:\$$columnaBaseEssalud\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 14},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 14},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 15}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseAguinaldo\$$filaBaseInicio:\$$columnaBaseAguinaldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 15},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 15},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  //CAMINO NACIONAL
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 17}')
          .formula =
      '=SUM($columnaResumenMonto${filaResumenInicio + 18}:$columnaResumenMonto${filaResumenInicio + 21})';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 18}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseSueldo\$$filaBaseInicio:\$$columnaBaseSueldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 18},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 18},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 19}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseEssalud\$$filaBaseInicio:\$$columnaBaseEssalud\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 19},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 19},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';
  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 20}')
          .formula =
      '=SUMIFS(BASE!\$$columnaBaseAguinaldo\$$filaBaseInicio:\$$columnaBaseAguinaldo\$$rowTotal,BASE!\$$columnaBaseFuente\$$filaBaseInicio:\$$columnaBaseFuente\$$rowTotal,\$$columnaResumenFuente${filaResumenInicio + 20},BASE!\$$columnaBaseProducto\$$filaBaseInicio:\$$columnaBaseProducto\$$rowTotal,\$$columnaResumenProducto${filaResumenInicio + 20},BASE!\$$columnaBaseEstado\$$filaBaseInicio:\$$columnaBaseEstado\$$rowTotal,\$$celdaResumenEstado\$3,BASE!\$$columnaBaseModalidad\$$filaBaseInicio:\$$columnaBaseModalidad\$$rowTotal,$celdaResumenModalidad)';

  sheet3
          .getRangeByName('$columnaResumenMonto${filaResumenInicio + 22}')
          .formula =
      '=$columnaResumenMonto$filaResumenInicio+$columnaResumenMonto${filaResumenInicio + 11}';
  sheet3
      .getRangeByName(
          '$columnaResumenMonto$filaResumenInicio:$columnaResumenMonto${filaResumenInicio + 22}')
      .numberFormat = '#,##0.00';
}
