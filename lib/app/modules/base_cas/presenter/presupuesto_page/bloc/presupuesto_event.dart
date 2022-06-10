part of 'presupuesto_bloc.dart';

abstract class PresupuestoEvent extends Equatable {
  const PresupuestoEvent();

  @override
  List<Object> get props => [];
}

class PresupuestoCasEventLoading extends PresupuestoEvent {
  final String anio;
  PresupuestoCasEventLoading({
    required this.anio,
  });
}

class PresupuestoCasEventLoaded extends PresupuestoEvent {}
