// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'conceptos_bloc.dart';

abstract class ConceptosState extends Equatable {
  const ConceptosState();

  @override
  List<Object> get props => [];
}

class ConceptosInitialState extends ConceptosState {}

class ConceptosLoadingState extends ConceptosState {}

class ConceptosLoadedState extends ConceptosState {
  final String codigoPlaza;
  final String nombres;
  final List<ConceptoEntity> conceptos;

  const ConceptosLoadedState({
    required this.codigoPlaza,
    required this.nombres,
    required this.conceptos,
  });

  @override
  List<Object> get props => [conceptos];
}

class ConceptosErrorState extends ConceptosState {
  final String message;

  ConceptosErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
