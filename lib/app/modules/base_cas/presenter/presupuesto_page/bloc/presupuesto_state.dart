part of 'presupuesto_bloc.dart';

abstract class PresupuestoState extends Equatable {
  const PresupuestoState();
}

class PresupuestoInitial extends PresupuestoState {
  @override
  List<Object?> get props => [];
}

class PresupuestoLoading extends PresupuestoState {
  @override
  List<Object?> get props => [];
}

class PresupuestoError extends PresupuestoState {
  final String message;
  PresupuestoError({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class PresupuestoLoaded extends PresupuestoState {
  final List<PresupuestoCasEntity> presupuestoCasList;
  PresupuestoLoaded({
    this.presupuestoCasList = const [],
  });

  @override
  List<Object?> get props => [presupuestoCasList];
}
