part of 'liquidacion_detalle_bloc.dart';

abstract class LiquidacionDetalleState extends Equatable {
  const LiquidacionDetalleState();
}

class LiquidacionDetalleError extends LiquidacionDetalleState {
  final String message;
  LiquidacionDetalleError({
    required this.message,
  });
  @override
  List<Object> get props => [this.message];
}

class LiquidacionDetalleLoaded extends LiquidacionDetalleState {
  final bool excludeFocus;
  final String nombres;
  final List<LiquidacionDetalleEntity> liquidacionDetalle;
  final bool allClasificadores;
  LiquidacionDetalleLoaded(
      {this.excludeFocus = true,
      this.nombres = '',
      this.liquidacionDetalle = const [],
      this.allClasificadores = false});

  @override
  List<Object> get props => [this.liquidacionDetalle];

  LiquidacionDetalleLoaded copyWith({
    bool? excludeFocus,
    String? nombres,
    List<LiquidacionDetalleEntity>? liquidacionDetalle,
    bool? allClasificadores,
  }) {
    return LiquidacionDetalleLoaded(
      excludeFocus: excludeFocus ?? this.excludeFocus,
      nombres: nombres ?? this.nombres,
      liquidacionDetalle: liquidacionDetalle ?? this.liquidacionDetalle,
      allClasificadores: allClasificadores ?? this.allClasificadores,
    );
  }
}

class LiquidacionDetalleResumenLoaded extends LiquidacionDetalleState {
  final bool allClasificador;
  final String dscCertificado;
  final String dscClasificador;
  final List<LiquidacionResumenEntity> liquidacionResumen;

  LiquidacionDetalleResumenLoaded({
    required this.allClasificador,
    required this.dscCertificado,
    required this.dscClasificador,
    required this.liquidacionResumen,
  });

  @override
  List<Object> get props => [
        this.dscCertificado,
        this.allClasificador,
        this.dscClasificador,
        this.liquidacionResumen
      ];

  @override
  String toString() {
    return 'SetLiquidacionResumenEvent(allClasificador: $allClasificador,  dscCertificado: $dscCertificado, dscClasificador: $dscClasificador)';
  }
}
