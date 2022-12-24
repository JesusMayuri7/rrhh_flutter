part of 'base_cas_bloc.dart';

@immutable
abstract class BaseCasState extends Equatable {
  const BaseCasState();
  @override
  List<Object?> get props => [];
}

class VoidBaseCasState extends BaseCasState {}

class FormLoadBaseCasState extends BaseCasState {
  final int mesInicio;
  final int mesFin;
  final double uit;
  final double porcentajeMaximoEssalud;
  final double porcentajeDescEssalud;
  final double aguinaldoSemestral;
  final double porcentajeSctrSalud;
  final double porcentajeSctrPension;
  final double porcentajeIgv;
  final bool isExportingData;
  FormLoadBaseCasState({
    this.isExportingData = false,
    required this.mesInicio,
    required this.mesFin,
    required this.uit,
    required this.porcentajeMaximoEssalud,
    required this.porcentajeDescEssalud,
    required this.aguinaldoSemestral,
    required this.porcentajeSctrSalud,
    required this.porcentajeSctrPension,
    required this.porcentajeIgv,
  });

  FormLoadBaseCasState copyWith(
    int? mesInicio,
    int? mesFin,
    double? uit,
    double? porcentajeMaximoEssalud,
    double? porcentajeDescEssalud,
    double? aguinaldoSemestral,
    double? porcentajeSctrSalud,
    double? porcentajeSctrPension,
    double? porcentajeIgv,
    bool? isExportingData,
  ) =>
      FormLoadBaseCasState(
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
          isExportingData: isExportingData ?? this.isExportingData);

  @override
  List<Object?> get props => [
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
}

class LoadingBaseCasState extends BaseCasState {
  @override
  List<Object?> get props => [];
}

class ExportingBaseCasState extends BaseCasState {
  @override
  List<Object?> get props => [];
}

class ExportedBaseCasState extends BaseCasState {
  @override
  List<Object?> get props => [];
}

class ErrorBaseCasState extends BaseCasState {
  final String message;
  ErrorBaseCasState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class LoadedBaseCasState extends BaseCasState {
  final List<BaseCasEntity> listBaseCasInit;
  final List<BaseCasEntity> listBaseCasCur;

  LoadedBaseCasState({
    required this.listBaseCasInit,
    required this.listBaseCasCur,
  });

  LoadedBaseCasState coyWidth({
    List<BaseCasEntity>? listBaseCasInit,
    List<BaseCasEntity>? listBaseCasCur,
  }) =>
      LoadedBaseCasState(
        listBaseCasInit: listBaseCasInit ?? this.listBaseCasInit,
        listBaseCasCur: listBaseCasCur ?? this.listBaseCasCur,
      );

  @override
  List<Object> get props => [
        listBaseCasInit,
        listBaseCasCur,
      ];
}
