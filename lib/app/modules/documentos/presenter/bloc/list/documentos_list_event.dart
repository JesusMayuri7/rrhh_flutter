// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'documentos_list_bloc.dart';

abstract class DocumentosListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DocumentosListLoad extends DocumentosListEvent {
  final String anio;
  DocumentosListLoad({required this.anio});

  @override
  List<Object> get props => [this.anio];
}

class DocumentosListFilterEvent extends DocumentosListEvent {
  final String control;
  final String estado;
  final String criterio;
  DocumentosListFilterEvent({
    required this.control,
    required this.estado,
    required this.criterio,
  });

  @override
  List<Object> get props => [this.criterio, this.control, this.estado];
}
