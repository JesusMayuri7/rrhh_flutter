part of 'requerimiento_list_bloc.dart';

abstract class RequerimientoListEvent extends Equatable {
  const RequerimientoListEvent();

  @override
  List<Object> get props => [];
}

class RequerimientoLoad extends RequerimientoListEvent {}
