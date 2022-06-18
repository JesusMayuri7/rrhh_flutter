enum ColumnBaseHeader {
  mesInicioTitle('U'),
  mesFinTitle('U'),
  mesInicioValue('V'),
  mesFinValue('V'),

  uitTitle('X'),
  uitValue('Y'),

  porcentajeMaxSueldoTitle('X'),
  porcentajeMaxSueldoValue('Y'),
  porcentajeEssaludTitle('X'),
  porcentajeEssaludValue('Y'),

  aguinaldoSemestralTitle('AA'),
  aguinaldoSemestralValue('AB'),

  primaSctrSaludTitle('AD'),
  primaSctrSaludValue('AE'),
  igvAdicionalSctrSaludTitle('AD'),
  igvAdicionalSctrSaludValue('AE'),

  primaSctrPensionTitle('AF'),
  primaSctrPensionValue('AG'),
  igvAdicionalSctrPensionTitle('AF'),
  igvAdicionalSctrPensionValue('AG'),
  comisionSctrPensionTitle('AF'),
  comisionSctrPensionValue('AG'),

  clasificadorSueldoValue('Z'),
  clasificadorEsaludValue('AA'),
  clasificadorAguinaldoValue('AB'),
  clasificadorSctrSaludValue('AE');

  final String columnLetter;

  const ColumnBaseHeader(this.columnLetter);
}

enum ColumnBaseTable {
  producto('C'),
  fuente('F'),
  meta('G'),
  estado('N'),
  mesInicio('V'),
  mesFin('W'),
  montoMensual('X'),
  essaludMensual('Y'),
  montoAnual('Z'),
  essaludAnual('AA'),
  aguinaldoAnual('AB'),
  total('AC'),
  sctrSaludMensual('AD'),
  sctrSaludAnual('AE'),
  sctrPensionMensual('AF'),
  sctrPensionAnual('AG');

  final String columnLetter;

  const ColumnBaseTable(this.columnLetter);
}

enum RowBaseHeader {
  uno(1),
  dos(2),
  tres(3),
  cuatro(4);

  final int rowIndex;

  const RowBaseHeader(this.rowIndex);
}
