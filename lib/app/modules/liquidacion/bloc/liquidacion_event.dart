part of 'liquidacion_bloc.dart';

abstract class LiquidacionEvent extends Equatable {
  const LiquidacionEvent();
}

class LiquidacionDataLoadedEvent extends LiquidacionEvent {
  final String anio;
  LiquidacionDataLoadedEvent({
    required this.anio,
  });

  @override
  List<Object> get props => [this.anio];
}

class LiquidacionUpdatedEvent extends LiquidacionEvent {
  final String dscCertificado;
  LiquidacionUpdatedEvent({
    required this.dscCertificado,
  });

  @override
  List<Object?> get props => [this.dscCertificado];
}
