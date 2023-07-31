enum ColumnBaseHeader {
  mesInicioTitle('AD'),
  mesFinTitle('AD'),
  mesInicioValue('AE'),
  mesFinValue('AE'),

  incrementoCasTitle('AF'),
  incrementoCasValue('AG'),

  sueldoTopeTitle('AF'),
  sueldoTopeValue('AG'),

  uitTitle('AH'),
  porcentajeMaxSueldoTitle('AH'),
  porcentajeEssaludTitle('AH'),

  uitValue('AI'),
  porcentajeMaxSueldoValue('AI'),
  porcentajeEssaludValue('AI'),

  aguinaldoSemestralTitle('AK'),
  aguinaldoSemestralValue('AL'),

  primaSctrSaludTitle('AM'),
  igvAdicionalSctrSaludTitle('AM'),

  primaSctrSaludValue('AN'),
  igvAdicionalSctrSaludValue('AN'),

  primaSctrPensionTitle('AP'),
  igvAdicionalSctrPensionTitle('AP'),
  comisionSctrPensionTitle('AP'),

  primaSctrPensionValue('AQ'),
  igvAdicionalSctrPensionValue('AQ'),
  comisionSctrPensionValue('AQ'),

  clasificadorSueldoValue('AJ'),
  clasificadorEssaludValue('AK'),
  clasificadorAguinaldoValue('AL'),
  clasificadorSctrSaludValue('AO'),

  montoAdicional('AS');

  final String columnLetter;

  const ColumnBaseHeader(this.columnLetter);
}

enum ColumnBaseTable {
  producto('G'),
  fuente('J'),
  meta('K'),
  estadoOpp('R'),
  mesInicio('AD'),
  mesFin('AE'),
  monto('AF'),
  incrementoCas('AG'),
  montoMensual('AH'),
  essaludMensual('AI'),
  montoAnual('AJ'),
  essaludAnual('AK'),
  aguinaldoAnual('AL'),
  total('AM'),
  sctrSaludMensual('AN'),
  sctrSaludAnual('AO'),
  sctrPensionMensual('AP'),
  sctrPensionAnual('AQ'),
  montoAdicional('AR'),
  essaludAdicional('AS'),
  aguinaldoAdicional('AT');

  final String columnLetter;

  const ColumnBaseTable(this.columnLetter);
}

enum RowBaseHeader {
  rowUno(1),
  rowDos(2),
  rowTres(3),
  rowCuatro(4);

  final int rowIndex;

  const RowBaseHeader(this.rowIndex);
}
