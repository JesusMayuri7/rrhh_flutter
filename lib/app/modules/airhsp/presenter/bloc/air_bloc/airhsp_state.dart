part of 'airhsp_bloc.dart';

abstract class AirhspState extends Equatable {
  const AirhspState();
  List<Object> get props => [];
}

class ListarAirhspState extends AirhspState {}

class EmptyAirhspState extends AirhspState {}

class LoadingAirhspState extends AirhspState {}

class DownloadedirhspState extends AirhspState {}

class LoadedAirhspState extends AirhspState {
  final List<AirhspEntity> listado;
  final List<ConceptoEntity> conceptos;

  LoadedAirhspState({required this.listado, required this.conceptos});

  @override
  List<Object> get props => [listado, conceptos];
}

class SelectedAirhspItemState extends AirhspState {
  final String ejecutora;
  final String codPlaza;
  final String tipoPersona;
  final String nombres;

  const SelectedAirhspItemState({
    required this.ejecutora,
    required this.codPlaza,
    required this.tipoPersona,
    required this.nombres,
  });
  @override
  List<Object> get props => [ejecutora, codPlaza, tipoPersona, nombres];
}

class ErrorAirhspState extends AirhspState {
  final String message;

  ErrorAirhspState({required this.message});

  @override
  List<Object> get props => [message];
}
