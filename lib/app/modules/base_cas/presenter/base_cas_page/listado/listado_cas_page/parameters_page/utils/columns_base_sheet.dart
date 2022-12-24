enum ColumnBaseHeader {
  mesInicioTitle('Y'),
  mesFinTitle('Y'),
  mesInicioValue('Z'),
  mesFinValue('Z'),

  uitTitle('AB'),
  uitValue('AC'),

  porcentajeMaxSueldoTitle('AB'),
  porcentajeMaxSueldoValue('AC'),
  porcentajeEssaludTitle('AB'),
  porcentajeEssaludValue('AC'),

  aguinaldoSemestralTitle('AE'),
  aguinaldoSemestralValue('AF'),

  primaSctrSaludTitle('AH'),
  primaSctrSaludValue('AI'),
  igvAdicionalSctrSaludTitle('AH'),
  igvAdicionalSctrSaludValue('AI'),

  primaSctrPensionTitle('AJ'),
  primaSctrPensionValue('AK'),
  igvAdicionalSctrPensionTitle('AJ'),
  igvAdicionalSctrPensionValue('AK'),
  comisionSctrPensionTitle('AJ'),
  comisionSctrPensionValue('AK'),

  clasificadorSueldoValue('AD'),
  clasificadorEssaludValue('AE'),
  clasificadorAguinaldoValue('AF'),
  clasificadorSctrSaludValue('AI');

  final String columnLetter;

  const ColumnBaseHeader(this.columnLetter);
}

enum ColumnBaseTable {
  producto('C'),
  fuente('F'),
  meta('G'),
  estadoOpp('N'),
  mesInicio('Z'),
  mesFin('AA'),
  montoMensual('AB'),
  essaludMensual('AC'),
  montoAnual('AD'),
  essaludAnual('AE'),
  aguinaldoAnual('AF'),
  total('AG'),
  sctrSaludMensual('AH'),
  sctrSaludAnual('AI'),
  sctrPensionMensual('AJ'),
  sctrPensionAnual('AK');

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
