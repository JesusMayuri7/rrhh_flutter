part of 'headparameters_bloc.dart';

abstract class HeadParametersEvent extends Equatable {
  const HeadParametersEvent();
}

class HeadParametersExportEvent extends HeadParametersEvent {
  final double uit;
  final double porcentajeMaximoEssalud;
  final double aguinaldoSemestral;
  final double porcentajeEssalud;
  final double porcentajePrimaSctrSalud;
  final double porcentajePrimaSctrPension;
  final double porcentajeComisionSctrPension;
  final double porcentajeIgv;
  final num incrementoCas;
  final int mesInicio;
  final int mesFin;
  final String anio;
  HeadParametersExportEvent(
      {required this.uit,
      required this.porcentajeMaximoEssalud,
      required this.aguinaldoSemestral,
      required this.porcentajeEssalud,
      required this.porcentajePrimaSctrSalud,
      required this.porcentajePrimaSctrPension,
      required this.porcentajeComisionSctrPension,
      required this.porcentajeIgv,
      required this.incrementoCas,
      required this.mesInicio,
      required this.mesFin,
      required this.anio});

  @override
  List<Object> get props => [
        uit,
        porcentajeEssalud,
        aguinaldoSemestral,
        porcentajeEssalud,
        porcentajePrimaSctrSalud,
        porcentajePrimaSctrPension,
        porcentajeComisionSctrPension,
        porcentajeIgv,
        incrementoCas,
        mesInicio,
        mesFin,
        anio
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}

class HeadParametersCalcularEvent extends HeadParametersEvent {
  final double uit;
  final double porcentajeMaximoEssalud;
  final double aguinaldoSemestral;
  final double porcentajeEssalud;
  final double porcentajePrimaSctrSalud;
  final double porcentajePrimaSctrPension;
  final double porcentajeComisionSctrPension;
  final double porcentajeIgv;
  final num incrementoCas;
  final int mesInicio;
  final int mesFin;
  final String anio;

  HeadParametersCalcularEvent(
      {required this.uit,
      required this.porcentajeMaximoEssalud,
      required this.aguinaldoSemestral,
      required this.porcentajeEssalud,
      required this.porcentajePrimaSctrSalud,
      required this.porcentajePrimaSctrPension,
      required this.porcentajeComisionSctrPension,
      required this.porcentajeIgv,
      required this.incrementoCas,
      required this.mesInicio,
      required this.mesFin,
      required this.anio});

  @override
  List<Object> get props => [
        uit,
        porcentajeMaximoEssalud,
        aguinaldoSemestral,
        porcentajeEssalud,
        porcentajePrimaSctrSalud,
        porcentajePrimaSctrPension,
        porcentajeComisionSctrPension,
        porcentajeIgv,
        incrementoCas,
        mesInicio,
        mesFin,
        anio
      ];
}

class HeadParametersFormLoadEvent extends HeadParametersEvent {
  final String dscVariable;
  final int modalidadId;
  final String anio;

  HeadParametersFormLoadEvent({
    required this.dscVariable,
    required this.modalidadId,
    required this.anio,
  });

  @override
  List<Object> get props => [dscVariable, modalidadId];
}

class HeadParametersListEvent extends HeadParametersEvent {
  final String anio;
  HeadParametersListEvent({
    required this.anio,
  });
  @override
  List<Object> get props => [this.anio];
}

class HeadParametersLoadingEvent extends HeadParametersEvent {
  @override
  List<Object> get props => [];
}

class HeadParametersExportingEvent extends HeadParametersEvent {
  @override
  List<Object> get props => [];
}
