part of 'requerimiento_new_bloc.dart';

abstract class RequerimientoNewState extends Equatable {
  const RequerimientoNewState();

  @override
  List<Object> get props => [];
}

class RequerimientoNewInitial extends RequerimientoNewState {}

class RequerimientoNewSaved extends RequerimientoNewState {}

class RequerimientoNewError extends RequerimientoNewState {}
