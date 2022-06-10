part of 'new_liquidacion_bloc.dart';

abstract class NewLiquidacionEvent extends Equatable {
  const NewLiquidacionEvent();

  @override
  List<Object> get props => [];
}

class GetLiquidacionClasificadoresEvent extends NewLiquidacionEvent {
  final String anio;
  GetLiquidacionClasificadoresEvent({
    required this.anio,
  });
}

class GetLiquidacionMetasEvent extends NewLiquidacionEvent {
  final String anio;
  GetLiquidacionMetasEvent({
    required this.anio,
  });
}

class GetLiquidacionCertificadosEvent extends NewLiquidacionEvent {
  final String anio;
  GetLiquidacionCertificadosEvent({
    required this.anio,
  });
}

class AddLiquidacionEvent extends NewLiquidacionEvent {
  final ParamsAddLiquidacion liquidacionEntity;
  AddLiquidacionEvent({
    required this.liquidacionEntity,
  });

  @override
  List<Object> get props => [this.liquidacionEntity];

  @override
  String toString() =>
      'AddLiquidacionEvent(liquidacionEntity: $liquidacionEntity)';
}

class AddClasificadorMontoEvent extends NewLiquidacionEvent {
  //final List<Map<String, dynamic>> clasificadorMonto;
  final ClasificadorEntity clasificadorEntity;
  final double montoCertificado;
  AddClasificadorMontoEvent({
    //required this.clasificadorMonto,
    required this.clasificadorEntity,
    required this.montoCertificado,
  });
}
