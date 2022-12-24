part of 'base_cas_bloc.dart';

@immutable
abstract class BaseCasEvent extends Equatable {
  BaseCasEvent([List props = const <dynamic>[]]) : super();
}

class FilterBaseCasEvent implements BaseCasEvent {
  final String filterText;
  FilterBaseCasEvent({
    required this.filterText,
  });
  @override
  List<Object?> get props => [filterText];

  @override
  bool? get stringify => throw UnimplementedError();
}

class ListarBaseCasEvent implements BaseCasEvent {
  final String anio;

  ListarBaseCasEvent({
    required this.anio,
  });
  @override
  List<Object> get props => [this.anio];

  @override
  bool get stringify => throw UnimplementedError();
}

class InitialBaseCasEvent implements BaseCasEvent {
  final String dscVariable;
  final int modalidadId;
  final String anio;

  InitialBaseCasEvent({
    required this.dscVariable,
    required this.modalidadId,
    required this.anio,
  });
  @override
  List<Object> get props => [dscVariable, modalidadId, anio];

  @override
  bool get stringify => true;
}

class ExportarBaseCasEvent implements BaseCasEvent {
  final double uit;
  final double porcentajeMaximoEssalud;
  final double aguinaldoSemestral;
  final double porcentajeEssalud;
  final double porcentajePrimaSctrSalud;
  final double porcentajeIgv;
  final int mesInicio;
  final int mesFin;
  ExportarBaseCasEvent(
      {required this.uit,
      required this.porcentajeMaximoEssalud,
      required this.aguinaldoSemestral,
      required this.porcentajeEssalud,
      required this.porcentajePrimaSctrSalud,
      required this.porcentajeIgv,
      required this.mesInicio,
      required this.mesFin});

  @override
  List<Object> get props => [
        uit,
        porcentajeEssalud,
        aguinaldoSemestral,
        porcentajeEssalud,
        porcentajePrimaSctrSalud,
        porcentajeIgv,
        mesInicio,
        mesFin,
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}

class CalcularBaseCasEvent implements BaseCasEvent {
  final double uit;
  final double porcentajeMaximoEssalud;
  final double aguinaldoSemestral;
  final double porcentajeEssalud;
  final double porcentajePrimaSctrSalud;
  final double porcentajeIgv;
  final int mesInicio;
  final int mesFin;
  CalcularBaseCasEvent(
      {required this.uit,
      required this.porcentajeMaximoEssalud,
      required this.aguinaldoSemestral,
      required this.porcentajeEssalud,
      required this.porcentajePrimaSctrSalud,
      required this.porcentajeIgv,
      required this.mesInicio,
      required this.mesFin});

  @override
  List<Object> get props => [
        uit,
        porcentajeEssalud,
        aguinaldoSemestral,
        porcentajeEssalud,
        porcentajePrimaSctrSalud,
        porcentajeIgv,
        mesInicio,
        mesFin,
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
