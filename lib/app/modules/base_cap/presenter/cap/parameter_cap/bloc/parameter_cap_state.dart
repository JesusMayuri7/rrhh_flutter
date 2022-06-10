part of 'parameter_cap_bloc.dart';

enum StatusCap {
  initial,
  parameterLoading,
  capLoading,
  parameterLoaded,
  capLoaded,
  error
}

abstract class ParameterCapState extends Equatable {
  const ParameterCapState();

  @override
  List<Object> get props => [];
}

class CapLoadedState extends ParameterCapState {
  final List<ParameterCapEntity> parameterBaseCap;
  final List<CapEntity> listadoBaseCap;
  final StatusCap statusCap;
  CapLoadedState({
    this.parameterBaseCap = const [],
    this.listadoBaseCap = const [],
    this.statusCap = StatusCap.initial,
  });

  @override
  List<Object> get props => [this.parameterBaseCap, this.listadoBaseCap];

  CapLoadedState copyWith(
      {List<ParameterCapEntity>? parameterBaseCap,
      List<CapEntity>? listadoBaseCap,
      StatusCap? statusCap}) {
    return CapLoadedState(
      parameterBaseCap: parameterBaseCap ?? this.parameterBaseCap,
      listadoBaseCap: listadoBaseCap ?? this.listadoBaseCap,
      statusCap: statusCap ?? this.statusCap,
    );
  }
}

class CapLoadingState extends ParameterCapState {}

class CapErrorState extends ParameterCapState {
  final String message;
  CapErrorState({
    required this.message,
  });
}
