enum ColumnPracBaseTable {
  producto('C'),
  fuente('F'),
  meta('G'),
  estadoOpp('N'),
  mesInicio('AJ'),
  mesFin('AK'),

  montoBase('U'),
  subvencionMensual('AL'),
  mediaSubvencionMensual('AM'),

  cantidadMediaSubvencion('AO'),
  mediaCalculo('AP'),
  pagoMediaSubvencion('AQ'),

  mediaSubvencionAnual('AR'),
  subvencionAnual('AN'),
  total('AS'),

  sctrPensionMensual('AJ'),
  sctrPensionAnual('AK');

  final String columnLetter;

  const ColumnPracBaseTable(this.columnLetter);
}
