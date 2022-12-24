part of 'requerimiento_new_bloc.dart';

abstract class RequerimientoNewEvent extends Equatable {
  const RequerimientoNewEvent();

  @override
  List<Object> get props => [];
}

class NewRequerimientoEvent extends RequerimientoNewEvent {}
