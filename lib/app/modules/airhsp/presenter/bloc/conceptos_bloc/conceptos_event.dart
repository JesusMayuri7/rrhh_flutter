part of 'conceptos_bloc.dart';

abstract class ConceptosEvent extends Equatable {
  const ConceptosEvent();

  @override
  List<Object> get props => [];
}

class ConceptosLoadEvent extends ConceptosEvent {
  final String ejecutora;
  final String codPlaza;
  final String tipoPersona;
  final String nombres;

  ConceptosLoadEvent(
      {required this.ejecutora,
      required this.codPlaza,
      required this.tipoPersona,
      required this.nombres});
}
