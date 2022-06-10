part of 'edti_confianza_bloc.dart';

abstract class EdtiConfianzaState extends Equatable {
  const EdtiConfianzaState();

  @override
  List<Object> get props => [];
}

class EdtiConfianzaInitial extends EdtiConfianzaState {}

class EdtiConfianzaError extends EdtiConfianzaState {
  final String message;
  EdtiConfianzaError({
    required this.message,
  });
}

class EditConfianzaSaving extends EdtiConfianzaState {}

class EdtiConfianzaSaved extends EdtiConfianzaState {
  final ConfianzaEntity confianzaEntity;

  EdtiConfianzaSaved({required this.confianzaEntity});

  @override
  List<Object> get props => [this.confianzaEntity];
}

class EditConfianzaCreated extends EdtiConfianzaState {
  final ConfianzaEntity confianzaEntity;

  EditConfianzaCreated({required this.confianzaEntity});

  @override
  List<Object> get props => [this.confianzaEntity];
}
