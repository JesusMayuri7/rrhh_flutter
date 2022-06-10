part of 'liquidacion_list_bloc.dart';

abstract class LiquidacionListEvent extends Equatable {
  const LiquidacionListEvent();
  List<Object> get props => [];
}

class GetListLiquidacionEvent extends LiquidacionListEvent {
  final String anio;
  final String modalidad;
  GetListLiquidacionEvent({
    required this.anio,
    required this.modalidad,
  });
  @override
  List<Object> get props => [this.anio, this.modalidad];
}

class UpdateLiquidacionEvent extends LiquidacionListEvent {
  final List<LiquidacionEntity> liquidacion;
  final int liquidacionId;
  final String campo;
  final dynamic valor;
  UpdateLiquidacionEvent({
    required this.liquidacion,
    required this.liquidacionId,
    required this.campo,
    required this.valor,
  });
  @override
  List<Object> get props => [];
}

class GetLiquidacionFillFormEvent extends LiquidacionListEvent {
  final String anio;
  final String modalidad;
  GetLiquidacionFillFormEvent({
    required this.anio,
    required this.modalidad,
  });
  @override
  List<Object> get props => [];
}

class SetLiquidacionFilteredAnioEvent extends LiquidacionListEvent {
  final String anio;

  SetLiquidacionFilteredAnioEvent({
    required this.anio,
  });
  @override
  List<Object> get props => [];
}

class SetLiquidacionFilteredModalidadEvent extends LiquidacionListEvent {
  final String dscModalidad;
  SetLiquidacionFilteredModalidadEvent({
    required this.dscModalidad,
  });
  @override
  List<Object> get props => [this.dscModalidad];
}

class SetLiquidacionFilteredTextEvent extends LiquidacionListEvent {
  final String criterio;
  final String anio;
  final String modalidad;
  SetLiquidacionFilteredTextEvent({
    required this.criterio,
    required this.anio,
    required this.modalidad,
  });
  @override
  List<Object> get props => [this.criterio, this.anio, this.modalidad];
}

class SetAllClasificadoresEvent extends LiquidacionListEvent {
  final bool allClasificadores;
  SetAllClasificadoresEvent({
    required this.allClasificadores,
  });
  @override
  List<Object> get props => [allClasificadores];
}

class SetLiquidacionDetalleEvent extends LiquidacionListEvent {
  //final List<LiquidacionEntity> liquidacion;
  final String dscCertificado;
  final String nombres;
  final List<LiquidacionDetalleEntity> liquidacionDetalle;

  SetLiquidacionDetalleEvent({
    //required this.liquidacion,
    required this.dscCertificado,
    this.nombres = '',
    required this.liquidacionDetalle,
  });
  @override
  List<Object> get props =>
      [this.dscCertificado, this.nombres, this.liquidacionDetalle];
}
