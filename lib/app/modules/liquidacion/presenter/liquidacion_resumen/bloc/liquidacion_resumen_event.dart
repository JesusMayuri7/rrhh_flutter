part of 'liquidacion_resumen_bloc.dart';

abstract class LiquidacionResumenEvent extends Equatable {
  const LiquidacionResumenEvent();

  @override
  List<Object> get props => [];
}

class LiquidacionResumenLoad extends LiquidacionResumenEvent {
  final bool allClasificador;
  final List<LiquidacionEntity> listLliquidacion;
  final String dscCertificado;
  final String dscClasificador;
  final String anio;

  LiquidacionResumenLoad({
    required this.allClasificador,
    required this.listLliquidacion,
    required this.dscCertificado,
    required this.dscClasificador,
    required this.anio,
  });

  @override
  List<Object> get props => [
        this.dscCertificado,
        this.listLliquidacion,
        this.allClasificador,
        this.dscClasificador,
        this.anio
      ];

  @override
  String toString() {
    return 'LiquidacionResumenLoad(allClasificador: $allClasificador, listLliquidacion: $listLliquidacion, dscCertificado: $dscCertificado, dscClasificador: $dscClasificador, anio: $anio)';
  }
}
