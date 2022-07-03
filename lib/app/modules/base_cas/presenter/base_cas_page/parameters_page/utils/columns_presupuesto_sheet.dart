enum ColumnPresupuestoHeader {
  ocupadoValue('X'),
  vacanteValue('Z');

  final String columnLetter;

  const ColumnPresupuestoHeader(this.columnLetter);
}

enum ColumnPresupuestoTable {
  fuente('B'),
  producto('C'),
  meta('D'),
  clasificador('E'),
  pim('G'),
  tCantidad('V'),
  tProyeccion('W'),
  devengado('I'),
  oCantidad('X'),
  oProyeccion('Y'),
  vCantidad('Z'),
  vProyeccion('AA'),
  cantidad('AB'),
  proyeccion('AC'),
  totalProyeccion('AD'),
  saldo('AE');

  final String columnLetter;

  const ColumnPresupuestoTable(this.columnLetter);
}

enum RowPresupuestoHeader {
  rowUno(1),
  rowDos(2),
  rowTres(3),
  rowCuatro(4);

  final int rowIndex;

  const RowPresupuestoHeader(this.rowIndex);
}
