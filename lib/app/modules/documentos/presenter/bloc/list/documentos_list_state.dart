part of 'documentos_list_bloc.dart';

abstract class DocumentosListState extends Equatable {
  const DocumentosListState();
  @override
  List<Object> get props => [];
}

class DocumentosListInitial extends DocumentosListState {
  @override
  List<Object> get props => [];
}

class DocumentosListLoading extends DocumentosListState {
  @override
  List<Object> get props => [];
}

class DocumentosListError extends DocumentosListState {
  final String message;

  DocumentosListError({required this.message});

  @override
  List<Object> get props => [this.message];
}

class DocumentosListLoaded extends DocumentosListState {
  final List<DocumentoEntity> documentosList;
  DocumentosListLoaded({
    required this.documentosList,
  });
  @override
  List<Object> get props => [this.documentosList];
}
