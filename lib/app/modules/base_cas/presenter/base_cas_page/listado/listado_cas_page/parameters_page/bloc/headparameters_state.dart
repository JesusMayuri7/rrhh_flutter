part of 'headparameters_bloc.dart';

abstract class HeadParametersState extends Equatable {
  const HeadParametersState();

  @override
  List<Object> get props => [];
}

enum StatusCas {
  initial,
  loadingParameter,
  failure,
  loadedParameter,
  loadingList,
  loadedList,
  calculating,
  calculated,
  exportingList,
  exportedList
}

class HeadParametersLoadingState extends HeadParametersState {}

class ErrorHeadParameterState extends HeadParametersState {
  final String message;
  ErrorHeadParameterState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class HeadParametersSuccessState extends HeadParametersState {
  final StatusCas status;
  final String message;
  final int mesInicio;
  final int mesFin;
  final double uit;
  final double porcentajeMaximoEssalud;
  final double porcentajeDescEssalud;
  final double aguinaldoSemestral;
  final double porcentajeSctrSalud;
  final double porcentajePrimaSctrPension;
  final double porcentajeComisionSctrPension;
  final double porcentajeIgv;
  final num incrementoCas;
  final bool isExportingData;
  final List<BaseCasEntity> listadoCas;
  final bool calcularMesesIniciales;

  HeadParametersSuccessState(
      {this.status = StatusCas.initial,
      this.message = 'Loading',
      this.isExportingData = false,
      this.mesInicio = 0,
      this.mesFin = 11,
      this.uit = 0,
      this.porcentajeMaximoEssalud = 0,
      this.porcentajeDescEssalud = 0,
      this.aguinaldoSemestral = 0,
      this.porcentajeSctrSalud = 0,
      this.porcentajePrimaSctrPension = 0,
      this.porcentajeComisionSctrPension = 0,
      this.porcentajeIgv = 0,
      this.incrementoCas = 0,
      this.listadoCas = const [],
      this.calcularMesesIniciales = false});

  HeadParametersSuccessState copyWith(
          {String? message,
          StatusCas? status,
          int? mesInicio,
          int? mesFin,
          double? uit,
          double? porcentajeMaximoEssalud,
          double? porcentajeDescEssalud,
          double? aguinaldoSemestral,
          double? porcentajeSctrSalud,
          double? porcentajePrimaSctrPension,
          double? porcentajeComisionSctrPension,
          double? porcentajeIgv,
          num? incrementoCas,
          bool? isExportingData,
          List<BaseCasEntity>? listadoCas,
          bool? calcularMesesIniciales}) =>
      HeadParametersSuccessState(
          status: status ?? this.status,
          message: message ?? this.message,
          mesInicio: mesInicio ?? this.mesInicio,
          mesFin: mesFin ?? this.mesFin,
          uit: uit ?? this.uit,
          porcentajeMaximoEssalud:
              porcentajeMaximoEssalud ?? this.porcentajeMaximoEssalud,
          porcentajeDescEssalud:
              porcentajeDescEssalud ?? this.porcentajeDescEssalud,
          aguinaldoSemestral: aguinaldoSemestral ?? this.aguinaldoSemestral,
          porcentajeSctrSalud: porcentajeSctrSalud ?? this.porcentajeSctrSalud,
          porcentajePrimaSctrPension:
              porcentajePrimaSctrPension ?? this.porcentajePrimaSctrPension,
          porcentajeComisionSctrPension: porcentajeComisionSctrPension ??
              this.porcentajeComisionSctrPension,
          porcentajeIgv: porcentajeIgv ?? this.porcentajeIgv,
          incrementoCas: incrementoCas ?? this.incrementoCas,
          isExportingData: isExportingData ?? this.isExportingData,
          listadoCas: listadoCas ?? this.listadoCas,
          calcularMesesIniciales:
              calcularMesesIniciales ?? this.calcularMesesIniciales);
  @override
  List<Object> get props => [
        mesInicio,
        mesFin,
        uit,
        porcentajeMaximoEssalud,
        porcentajeDescEssalud,
        aguinaldoSemestral,
        porcentajeSctrSalud,
        porcentajePrimaSctrPension,
        porcentajeComisionSctrPension,
        porcentajeIgv,
        incrementoCas,
        isExportingData,
        listadoCas,
        message,
        status,
        calcularMesesIniciales
      ];
}

class HeadParametersInitialState extends HeadParametersState {
  final int mesInicio;
  final int mesFin;
  final double uit;
  final double porcentajeMaximoEssalud;
  final double porcentajeDescEssalud;
  final double aguinaldoSemestral;
  final double porcentajeSctrSalud;
  final double porcentajeSctrPension;
  final double porcentajeIgv;
  final num incrementoCas;

  final bool isExportingData;
  HeadParametersInitialState(
      {this.isExportingData = false,
      this.mesInicio = 0,
      this.mesFin = 11,
      this.uit = 0,
      this.porcentajeMaximoEssalud = 0,
      this.porcentajeDescEssalud = 0,
      this.aguinaldoSemestral = 0,
      this.porcentajeSctrSalud = 0,
      this.porcentajeSctrPension = 0,
      this.porcentajeIgv = 0,
      this.incrementoCas = 0});

  HeadParametersInitialState copyWith(
    int? mesInicio,
    int? mesFin,
    double? uit,
    double? porcentajeMaximoEssalud,
    double? porcentajeDescEssalud,
    double? aguinaldoSemestral,
    double? porcentajeSctrSalud,
    double? porcentajeSctrPension,
    double? porcentajeIgv,
    num? incrementoCas,
    bool? isExportingData,
  ) =>
      HeadParametersInitialState(
          mesInicio: mesInicio ?? this.mesInicio,
          mesFin: mesFin ?? this.mesFin,
          uit: uit ?? this.uit,
          porcentajeMaximoEssalud:
              porcentajeMaximoEssalud ?? this.porcentajeMaximoEssalud,
          porcentajeDescEssalud:
              porcentajeDescEssalud ?? this.porcentajeDescEssalud,
          aguinaldoSemestral: aguinaldoSemestral ?? this.aguinaldoSemestral,
          porcentajeSctrSalud: porcentajeSctrSalud ?? this.porcentajeSctrSalud,
          porcentajeSctrPension:
              porcentajeSctrPension ?? this.porcentajeSctrPension,
          porcentajeIgv: porcentajeIgv ?? this.porcentajeIgv,
          incrementoCas: incrementoCas ?? this.incrementoCas,
          isExportingData: isExportingData ?? this.isExportingData);

  @override
  List<Object> get props => [
        mesInicio,
        mesFin,
        uit,
        porcentajeMaximoEssalud,
        porcentajeDescEssalud,
        aguinaldoSemestral,
        porcentajeSctrSalud,
        porcentajeSctrPension,
        porcentajeIgv,
        incrementoCas,
        isExportingData
      ];
}


/*
class HeadParametersCalcularState extends HeadParametersState {
  final int mesInicio;
  final int mesFin;
  final double uit;
  final double porcentajeMaximoEssalud;
  final double porcentajeDescEssalud;
  final double aguinaldoSemestral;
  final double porcentajeSctrSalud;
  final double porcentajeIgv;
  final bool isExportingData;
  HeadParametersCalcularState({
    this.isExportingData = false,
    required this.mesInicio,
    required this.mesFin,
    required this.uit,
    required this.porcentajeMaximoEssalud,
    required this.porcentajeDescEssalud,
    required this.aguinaldoSemestral,
    required this.porcentajeSctrSalud,
    required this.porcentajeIgv,
  });

  HeadParametersCalcularState copyWith(
    int? mesInicio,
    int? mesFin,
    double? uit,
    double? porcentajeMaximoEssalud,
    double? porcentajeDescEssalud,
    double? aguinaldoSemestral,
    double? porcentajeSctrSalud,
    double? porcentajeIgv,
    bool? isExportingData,
  ) =>
      HeadParametersCalcularState(
          mesInicio: mesInicio ?? this.mesInicio,
          mesFin: mesFin ?? this.mesFin,
          uit: uit ?? this.uit,
          porcentajeMaximoEssalud:
              porcentajeMaximoEssalud ?? this.porcentajeMaximoEssalud,
          porcentajeDescEssalud:
              porcentajeDescEssalud ?? this.porcentajeDescEssalud,
          aguinaldoSemestral: aguinaldoSemestral ?? this.aguinaldoSemestral,
          porcentajeSctrSalud: porcentajeSctrSalud ?? this.porcentajeSctrSalud,
          porcentajeIgv: porcentajeIgv ?? this.porcentajeIgv,
          isExportingData: isExportingData ?? this.isExportingData);

  @override
  List<Object> get props => [
        mesInicio,
        mesFin,
        uit,
        porcentajeMaximoEssalud,
        porcentajeDescEssalud,
        aguinaldoSemestral,
        porcentajeSctrSalud,
        porcentajeIgv,
        isExportingData
      ];
}*/
