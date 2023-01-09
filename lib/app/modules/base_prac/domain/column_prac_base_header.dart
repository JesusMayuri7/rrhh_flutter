enum ParameterPracBaseHeader {
  mesInicioTitle('AK'),
  mesFinTitle('AK'),
  mesInicioValue('AL'),
  mesFinValue('AL'),

  // Cantidad de medias subvenciones
  ocupadoTitle('AN'),
  vacanteTitle('AN'),
  ocupadoValue('AO'),
  vacanteValue('AO'),

  // Row init parameter
  rowUno('1'),
  rowDos('2');

  final String columnLetter;

  const ParameterPracBaseHeader(this.columnLetter);
}
