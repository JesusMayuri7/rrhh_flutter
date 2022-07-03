part of 'parameter_cap_bloc.dart';

abstract class ParameterCapEvent extends Equatable {
  const ParameterCapEvent();

  @override
  List<Object> get props => [];
}

class LoadCapEvent extends ParameterCapEvent {
  final String anio;
  LoadCapEvent({
    required this.anio,
  });
}

class CalcularCapEvent extends ParameterCapEvent {
  final ParamsCalcularListBaseCap paramsCalcularListBaseCap;
  CalcularCapEvent({
    required this.paramsCalcularListBaseCap,
  });
}

class LoadParameterEvent extends ParameterCapEvent {
  final String anio;
  LoadParameterEvent({
    required this.anio,
  });
}

class ExportCapEvent extends ParameterCapEvent {
  final List<BaseCapEntity> listCap;
  final String anio;

  ExportCapEvent({
    required this.listCap,
    required this.anio,
  });
}
