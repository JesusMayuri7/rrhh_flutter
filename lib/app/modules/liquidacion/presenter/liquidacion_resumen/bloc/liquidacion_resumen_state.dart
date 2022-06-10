part of 'liquidacion_resumen_bloc.dart';

abstract class LiquidacionResumenState extends Equatable {
  const LiquidacionResumenState();
}

class LiquidacionResumenError extends LiquidacionResumenState {
  final String message;
  LiquidacionResumenError({
    required this.message,
  });
  List<Object?> get props => [this.message];
}

class LiquidacionResumenLoaded extends LiquidacionResumenState {
  final bool allClasificador;
  final String dscClasificador;
  final String dscCertificado;
  final List<LiquidacionResumenEntity> liquidacionResumenSiaf;
  final List<LiquidacionResumenEntity> liquidacionResumenLiquidacion;
  LiquidacionResumenLoaded(
      {this.allClasificador = true,
      this.dscClasificador = 'TODOS',
      this.liquidacionResumenSiaf = const [],
      this.liquidacionResumenLiquidacion = const [],
      this.dscCertificado = ''});

  @override
  List<Object> get props => [
        this.liquidacionResumenSiaf,
        this.liquidacionResumenLiquidacion,
        this.allClasificador,
        this.dscCertificado,
        this.dscClasificador
      ];

  LiquidacionResumenLoaded copyWith({
    bool? allClasificador,
    String? dscClasificador,
    String? dscCertificado,
    List<LiquidacionResumenEntity>? liquidacionResumenSiaf,
    List<LiquidacionResumenEntity>? liquidacionResumenLiquidacion,
  }) {
    return LiquidacionResumenLoaded(
      allClasificador: allClasificador ?? this.allClasificador,
      dscClasificador: dscClasificador ?? this.dscClasificador,
      dscCertificado: dscCertificado ?? this.dscCertificado,
      liquidacionResumenSiaf:
          liquidacionResumenSiaf ?? this.liquidacionResumenSiaf,
      liquidacionResumenLiquidacion:
          liquidacionResumenLiquidacion ?? this.liquidacionResumenLiquidacion,
    );
  }
}
