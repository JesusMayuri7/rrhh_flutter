part of 'list_prac_bloc.dart';

abstract class ListarPracEvent extends Equatable {
  const ListarPracEvent();
}

class ListPracEvent extends ListarPracEvent {
  final String anio;

  ListPracEvent({
    required this.anio,
  });

  @override
  List<Object> get props => [this.anio];
}

class AltaBajaListEvent extends ListarPracEvent {
  final List<PracticanteEntity> listPracticanteFiltered;
  final List<PracticanteEntity> listPracticanteOriginal;

  AltaBajaListEvent({
    this.listPracticanteFiltered = const [],
    this.listPracticanteOriginal = const [],
  });

  @override
  List<Object> get props =>
      [this.listPracticanteFiltered, this.listPracticanteOriginal];
}

class FilterPracEvent extends ListarPracEvent {
  final String textFilter;

  FilterPracEvent({
    required this.textFilter,
  });

  @override
  List<Object?> get props => [this.textFilter];
}

class UpdatedPracEvent extends ListarPracEvent {
  final int practicanteId;
  final String campo;
  final dynamic valor;
  UpdatedPracEvent({
    required this.practicanteId,
    required this.campo,
    required this.valor,
  });
  @override
  List<Object> get props => [practicanteId, campo, valor];
}
