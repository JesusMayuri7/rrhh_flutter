// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final List<DocumentoEntity> documentosListOriginal;
  final List<DocumentoEntity> documentosListFiltered;
  DocumentosListLoaded({
    required this.documentosListOriginal,
    required this.documentosListFiltered,
  });
  @override
  List<Object> get props =>
      [this.documentosListOriginal, this.documentosListFiltered];

  DocumentosListLoaded copyWith({
    List<DocumentoEntity>? documentosListOriginal,
    List<DocumentoEntity>? documentosListFiltered,
  }) {
    return DocumentosListLoaded(
      documentosListOriginal:
          documentosListOriginal ?? this.documentosListOriginal,
      documentosListFiltered:
          documentosListFiltered ?? this.documentosListFiltered,
    );
  }
}
