part of 'resumen_bloc.dart';

abstract class ResumenEvent extends Equatable {
  const ResumenEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ResumenCasEventInitial extends ResumenEvent {}

class ResumenCasEventPresupuestoLoading extends ResumenEvent {
  final List<PresupuestoCasEntity> presupuestoCasList;
  ResumenCasEventPresupuestoLoading({
    required this.presupuestoCasList,
  });

  @override
  List<Object?> get props => [presupuestoCasList];
}

class ResumenCasEventBaseCasLoading extends ResumenEvent {
  final List<BaseCasEntity> baseCasList;
  ResumenCasEventBaseCasLoading({
    required this.baseCasList,
  });

  @override
  List<Object?> get props => [baseCasList];
}

class ResumenCasEventLoading extends ResumenEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ResumenCasEventRefresh extends ResumenEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ResumenCasEventLoaded extends ResumenEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
