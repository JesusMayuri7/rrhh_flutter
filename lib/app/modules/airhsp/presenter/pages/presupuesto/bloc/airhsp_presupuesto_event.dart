// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'airhsp_presupuesto_bloc.dart';

abstract class AirhspPresupuestoEvent extends Equatable {
  const AirhspPresupuestoEvent();
}

class ListPracEvent extends AirhspPresupuestoEvent {
  final String anio;
  final bool cts;
  final bool gratificacion;
  final bool bonificacion;

  ListPracEvent({
    required this.anio,
    required this.cts,
    required this.gratificacion,
    required this.bonificacion,
  });

  @override
  List<Object> get props => [this.anio,this.cts,this.gratificacion,this.bonificacion];
}

class ListAirhspExtEvent extends AirhspPresupuestoEvent {
  final String anio;

  ListAirhspExtEvent({
    required this.anio,
  });

  @override
  List<Object> get props => [this.anio];
}


class TotalesAirhspEvent extends AirhspPresupuestoEvent {
  final List<AirhspPresupuestoEntity> listPracticanteFiltered;
  final bool cts;
  final bool gratificacion;
  final bool bonificacion;
  
  TotalesAirhspEvent({
    this.listPracticanteFiltered = const [],
    required this.cts,
    required this.gratificacion,
    required this.bonificacion,
  });

  @override
  List<Object> get props => [this.listPracticanteFiltered,this.cts,this.gratificacion,this.bonificacion];
}

class CalculoAirhspEvent extends AirhspPresupuestoEvent {
  final List<AirhspPresupuestoEntity> listPracticanteFiltered;
  final bool cts;
  final bool gratificacion;
  final bool bonificacion;
  
  CalculoAirhspEvent({
    this.listPracticanteFiltered = const [],
    required this.cts,
    required this.gratificacion,
    required this.bonificacion,
  });

  @override
  List<Object> get props => [this.listPracticanteFiltered,this.cts,this.gratificacion,this.bonificacion];
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
