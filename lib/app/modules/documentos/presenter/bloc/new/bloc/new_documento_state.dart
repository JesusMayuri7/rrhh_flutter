part of 'new_documento_bloc.dart';

abstract class NewDocumentoState extends Equatable {
  const NewDocumentoState();

  @override
  List<Object> get props => [];
}

class NewDocumentoInitial extends NewDocumentoState {}

class NewDocumentoSaved extends NewDocumentoState {
  final DocumentoEntity documentoEntity;

  NewDocumentoSaved({required this.documentoEntity});

  @override
  List<Object> get props => [this.documentoEntity];
}

class NewDocumentoError extends NewDocumentoState {
  final String message;

  NewDocumentoError({required this.message});
  @override
  List<Object> get props => [this.message];
}
