// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'airhsp_presupuesto_bloc.dart';

abstract class AirhspPresupuestoEvent extends Equatable {
  const AirhspPresupuestoEvent();
}

class ListPracEvent extends AirhspPresupuestoEvent {
  final String anio;

  ListPracEvent({
    required this.anio,
  });

  @override
  List<Object> get props => [this.anio];
}

class AltaBajaListEvent extends AirhspPresupuestoEvent {
  final List<AirhspPresupuestoEntity> listPracticanteFiltered;
  final List<AirhspPresupuestoEntity> listPracticanteOriginal;

  AltaBajaListEvent({
    this.listPracticanteFiltered = const [],
    this.listPracticanteOriginal = const [],
  });

  @override
  List<Object> get props =>
      [this.listPracticanteFiltered, this.listPracticanteOriginal];
}

class FilterPracEvent extends AirhspPresupuestoEvent {
  final String textFilter;

  FilterPracEvent({
    required this.textFilter,
  });

  @override
  List<Object?> get props => [this.textFilter];
}

class UpdatedPracEvent extends AirhspPresupuestoEvent {
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
