import 'package:equatable/equatable.dart';

class LiquidacionResumenEntity extends Equatable {
  LiquidacionResumenEntity({
    required this.fuente,
    required this.finalidad,
    required this.clasificador,
    required this.montoCertificado,
    required this.montoLiquidacion,
    required this.montoDevengado,
    required this.montoDevolucion,
    required this.saldo,
  });

  final String fuente;
  final String finalidad;
  final String clasificador;
  final String montoCertificado;
  final String montoLiquidacion;
  final String montoDevengado;
  final String montoDevolucion;
  final String saldo;

  @override
  List<Object> get props {
    return [
      fuente,
      finalidad,
      clasificador,
      montoCertificado,
      montoLiquidacion,
      montoDevengado,
      montoDevolucion,
      saldo,
    ];
  }

  @override
  bool get stringify => true;
}
