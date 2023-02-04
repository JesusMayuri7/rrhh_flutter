enum ColumnPracBaseTable {
  producto('C'),
  fuente('F'),
  meta('G'),
  estadoOpp('N'),
  montoBase('U'),
  mesInicio('AJ'),
  mesFin('AK'),

  subvencionMensual('AL'),
  mediaSubvencionMensual('AM'),

  cantidadMediaSubvencion('AO'),
  mediaCalculo('AP'),
  pagoMediaSubvencion('AQ'),

  subvencionAnual('AN'),
  mediaSubvencionAnual('AR'),
  total('AS');

  //sctrPensionMensual('AJ'),
  //sctrPensionAnual('AK');

  final String columnLetter;

  const ColumnPracBaseTable(this.columnLetter);
}
