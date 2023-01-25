class ResumenEntity {
  int anoEje;
  String fuente;
  String producto;
  String especifica;
  num pim;
  num devengado;
  int cantidadOcupado;
  num montoOcupado;
  int cantidadVacante;
  num montoVacante;
  int cantidadProyectado;
  num montoProyectado;
  int cantidadTotal;
  num montoTotal;
  num saldo;
  ResumenEntity({
    required this.anoEje,
    required this.fuente,
    required this.producto,
    required this.especifica,
    required this.pim,
    required this.devengado,
    required this.cantidadOcupado,
    required this.montoOcupado,
    required this.cantidadVacante,
    required this.montoVacante,
    required this.cantidadProyectado,
    required this.montoProyectado,
    required this.cantidadTotal,
    required this.montoTotal,
    required this.saldo,
  });

  ResumenEntity copyWith({
    int? anoEje,
    String? fuente,
    String? producto,
    String? especifica,
    num? pim,
    num? devengado,
    int? cantidadOcupado,
    num? montoOcupado,
    int? cantidadVacante,
    num? montoVacante,
    int? cantidadProyectado,
    num? montoProyectado,
    int? cantidadTotal,
    num? montoTotal,
    num? saldo,
  }) {
    return ResumenEntity(
      anoEje: anoEje ?? this.anoEje,
      fuente: fuente ?? this.fuente,
      producto: producto ?? this.producto,
      especifica: especifica ?? this.especifica,
      pim: pim ?? this.pim,
      devengado: devengado ?? this.devengado,
      cantidadOcupado: cantidadOcupado ?? this.cantidadOcupado,
      montoOcupado: montoOcupado ?? this.montoOcupado,
      cantidadVacante: cantidadVacante ?? this.cantidadVacante,
      montoVacante: montoVacante ?? this.montoVacante,
      cantidadProyectado: cantidadProyectado ?? this.cantidadProyectado,
      montoProyectado: montoProyectado ?? this.montoProyectado,
      cantidadTotal: cantidadTotal ?? this.cantidadTotal,
      montoTotal: montoTotal ?? this.montoTotal,
      saldo: saldo ?? this.saldo,
    );
  }
}
