enum ColumnCertificadoHeader {
  ocupadoValue('X'),
  vacanteValue('Z');

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
  cantidad('AB'),
  proyeccion('AC'),
  totalProyeccion('AD'),
  saldo('AE');

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
