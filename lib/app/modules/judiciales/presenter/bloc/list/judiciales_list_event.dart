part of 'judiciales_list_bloc.dart';

abstract class JudicialesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class JudicialesListLoad extends JudicialesListEvent {
  final String anio;
  JudicialesListLoad({required this.anio});

  @override
  List<Object> get props => [this.anio];
}

class JudicialesListFilter extends JudicialesListEvent {
  final String criterio;
  JudicialesListFilter({required this.criterio});

  @override
  List<Object> get props => [this.criterio];
}