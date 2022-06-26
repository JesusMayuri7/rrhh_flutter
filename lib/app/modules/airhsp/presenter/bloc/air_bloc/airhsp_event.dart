import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AirhspEvent extends Equatable {
  const AirhspEvent();
  List<Object> get props => [];
}

class ListarEvent extends AirhspEvent {
  final String ejecutora;
  final String tipoPersona;

  ListarEvent({required this.ejecutora, required this.tipoPersona});

  @override
  List<Object> get props => [ejecutora, tipoPersona];
}

class SearchEvent extends AirhspEvent {
  final String criterio;

  SearchEvent({required this.criterio});
}

class DownloadFileEvent extends AirhspEvent {
  final String tipoPersona;

  DownloadFileEvent({required this.tipoPersona});

  @override
  List<Object> get props => [tipoPersona];
}

class SelectedItemEvent extends AirhspEvent {
  final String ejecutora;
  final String codPlaza;
  final String tipoPersona;
  final String nombres;

  SelectedItemEvent({
    required this.ejecutora,
    required this.codPlaza,
    required this.tipoPersona,
    required this.nombres,
  });
  @override
  List<Object> get props => [ejecutora, codPlaza, tipoPersona, nombres];
}
