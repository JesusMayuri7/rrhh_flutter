part of 'airhsp_presupuesto_bloc.dart';

abstract class AirshpPresupuestoState extends Equatable {
  const AirshpPresupuestoState();
}

class AirhspPresupuestoLoading extends AirshpPresupuestoState {
  @override
  List<Object> get props => [];
}

class AirhspPresupuestoExported extends AirshpPresupuestoState {
  @override
  List<Object> get props => [];
}

class AirhspPresupuestoLoaded extends AirshpPresupuestoState {
  final List<AirhspPresupuestoEntity> listPracticanteFiltered;
  final List<AirhspPresupuestoEntity> listPracticanteOriginal;

  AirhspPresupuestoLoaded({
    this.listPracticanteFiltered = const [],
    this.listPracticanteOriginal = const [],
  });

  @override
  List<Object> get props =>
      [this.listPracticanteFiltered, this.listPracticanteOriginal];

  AirhspPresupuestoLoaded copyWith({
    List<AirhspPresupuestoEntity>? listPracticanteFiltered,
    List<AirhspPresupuestoEntity>? listPracticanteOriginal,
  }) {
    return AirhspPresupuestoLoaded(
      listPracticanteFiltered:
          listPracticanteFiltered ?? this.listPracticanteFiltered,
      listPracticanteOriginal:
          listPracticanteOriginal ?? this.listPracticanteOriginal,
    );
  }
}

class AirhspPresupuestoError extends AirshpPresupuestoState {
  final String message;
  AirhspPresupuestoError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
