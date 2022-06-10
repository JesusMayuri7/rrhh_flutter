part of 'conceptos_bloc.dart';

abstract class ConceptosState extends Equatable {
  const ConceptosState();

  @override
  List<Object> get props => [];
}

class ConceptosInitialState extends ConceptosState {}

class ConceptosLoadingState extends ConceptosState {}

class ConceptosLoadedState extends ConceptosState {
  final List<ConceptoEntity> conceptos;

  const ConceptosLoadedState(this.conceptos);

  @override
  List<Object> get props => [conceptos];
}

class ConceptosErrorState extends ConceptosState {
  final String message;

  ConceptosErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
