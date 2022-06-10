part of 'liquidacion_detalle_bloc.dart';

abstract class LiquidacionDetalleEvent extends Equatable {
  const LiquidacionDetalleEvent();

  @override
  List<Object> get props => [];
}

class SetLiquidacionDetalleEvent extends LiquidacionDetalleEvent {
  final String dscCertificado;
  final String nombres;
  final List<LiquidacionDetalleEntity> liquidacionDetalle;

  SetLiquidacionDetalleEvent({
    required this.dscCertificado,
    required this.nombres,
    required this.liquidacionDetalle,
  });
}

class SetFocusLiquidacionDetalleEvent extends LiquidacionDetalleEvent {
  final bool excludeFocus;

  SetFocusLiquidacionDetalleEvent({required this.excludeFocus});
}

class UpdatedLiquidacionDetalleEvent extends LiquidacionDetalleEvent {
  final List<LiquidacionDetalleEntity> liquidacionDetalle;
  final int liquidacionDetalleId;
  final String dscMonto;
  final double monto;
  UpdatedLiquidacionDetalleEvent({
    required this.liquidacionDetalle,
    required this.liquidacionDetalleId,
    required this.dscMonto,
    required this.monto,
  });
  @override
  List<Object> get props => [];
}

class SetLiquidacionDetalleResumenEvent extends LiquidacionDetalleEvent {
  final bool allClasificador;

  final String dscCertificado;
  final String dscClasificador;

  SetLiquidacionDetalleResumenEvent(
      {required this.allClasificador,
      required this.dscClasificador,
      required this.dscCertificado});

  @override
  List<Object> get props =>
      [this.dscCertificado, this.allClasificador, this.dscClasificador];

  @override
  String toString() {
    return 'SetLiquidacionResumenEvent(allClasificador: $allClasificador,  dscCertificado: $dscCertificado, dscClasificador: $dscClasificador)';
  }
}
