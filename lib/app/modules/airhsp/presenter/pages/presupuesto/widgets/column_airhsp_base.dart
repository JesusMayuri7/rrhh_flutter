enum ColumnAirhspBase {

  
  remPrinRO(10),
  remPrinRDR(11),  
  bonificacionFamiliar(12),
  incremento(13),
  basicoMensual(14),
  essaludMensual(15),
  basicoAnual(16),
  essaludAnual(17),
  escolaridad(18),
  gratificacion(19),
  bonificacionExtraordinaria(20),
  ctsAnual(21),
  totalAnual(22);
  
  //sctrPensionMensual('AJ'),
  //sctrPensionAnual('AK');

  final int colIndex;

  const ColumnAirhspBase(this.colIndex);
}