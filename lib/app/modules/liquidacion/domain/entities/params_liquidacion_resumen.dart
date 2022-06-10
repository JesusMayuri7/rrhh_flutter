class ParamsLiquidacionResumen {
  final String dscClasificador;
  final String dscCertificado;
  final String anio;
  ParamsLiquidacionResumen(
      {required this.dscClasificador,
      required this.dscCertificado,
      required this.anio});

  @override
  String toString() =>
      'ParamsLiquidacionResumen(dscClasificador: $dscClasificador, dscCertificado: $dscCertificado, anio: $anio)';
}
