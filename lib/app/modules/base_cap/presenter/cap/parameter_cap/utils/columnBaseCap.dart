enum ColumnBaseCap {
  fuente('AF'),
  producto('AN'),
  meta('AL'),
  estadoOpp('AA\$2'),   // Celda de la hoja de presupuesto como referencia a la Hoja Base y columna EstadoOpp
  epsAporta('BA'),
  montoBasico('BB'),
  incremento('BC'),
  montoMensual('BD'),  
  porcentajeEscalaAnterior('BE'),  
  montoEscalaAnterior('BF'),  
  porcentajeEscala('BG'),  
  montoEscala('BH'),  
  porcentajeEscalaNext('BI'),  
  montoEscalaNext('BJ'),  
  asignacionFamiliar('BK'),  
  totalBasico('BL'),
  essalud('BM'),
  epsSalud('BN'),
  sctrSalud('BO'),
  sctrSaludGrati('BP'),
  vidaLey('BQ'),
  sctrPension('BR'),
  sctrPensionGrati('BS'),
  uniforme('AY'),
  vale('AZ');
  
  

  final String columnLetter;

  const ColumnBaseCap(this.columnLetter);
}

enum ColumnBaseCapInt {
  fuente(0),
  producto(0),
  meta(0),
  estadoOpp(0),  
  montoBasico(54),
  incremento(55),
  montoMensual(56),  
  porcentajeEscalaAnterior(57),  
  montoEscalaAnterior(58),  
  porcentajeEscala(59),  
  montoEscala(60),  
  porcentajeEscalaNext(61),  
  montoEscalaNext(62),  
  asignacionFamiliar(63),  
  totalBasico(64),
  uniforme(150),
  vale(151),
  totalG(152);
  
  final int columnIndex;

  const ColumnBaseCapInt(this.columnIndex);
}