enum ColumnCertificadoHeader {
  ocupadoValue('X'),
  vacanteValue('Z'),
  confianzaValue('AB'),
  reservadoValue('AD'),
  nuevoValue('AF');

  final String columnLetter;

  const ColumnCertificadoHeader(this.columnLetter);
}

enum ColumnCertificadoTable {
  fuente('B'),
  producto('C'),
  meta('D'),
  clasificador('E'),
  certificado('H'),
  devengado('I'),
  tCantidad('V'),
  tProyeccion('W'),
  oCantidad('X'),
  oProyeccion('Y'),
  vCantidad('Z'),
  vProyeccion('AA'),
  cCantidad('AB'),
  cProyeccion('AC'),
  rCantidad('AD'),
  rProyeccion('AE'),
  nCantidad('AF'),
  nProyeccion('AG'),

  cantidad('AH'),
  proyeccion('AI'),
  totalProyeccion('AJ'),
  saldo('AK');

  final String columnLetter;

  const ColumnCertificadoTable(this.columnLetter);
}

enum RowCertificadoHeader {
  rowUno(1),
  rowDos(2),
  rowTres(3),
  rowCuatro(4);

  final int rowIndex;

  const RowCertificadoHeader(this.rowIndex);
}
