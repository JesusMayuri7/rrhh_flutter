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
