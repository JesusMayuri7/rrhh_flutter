part of 'new_liquidacion_bloc.dart';

abstract class NewLiquidacionState extends Equatable {
  const NewLiquidacionState();

  @override
  List<Object> get props => [];
}

enum AddLiquidacionStatus { Initial, Send, Added }

class NewLiquidacionInitial extends NewLiquidacionState {}

class NewLiquidacionError extends NewLiquidacionState {
  final String message;
  NewLiquidacionError({
    required this.message,
  });
}

class NewLiquidacionClasificadorSuccess extends NewLiquidacionState {
  final List<ClasificadorEntity> clasificadores;

  NewLiquidacionClasificadorSuccess({
    required this.clasificadores,
  });
}

class NewLiquidacionSuccessState extends NewLiquidacionState {
  final List<Map<String, dynamic>> clasificadorMonto;
  final List<ClasificadorEntity> clasificadores;
  NewLiquidacionSuccessState({
    required this.clasificadores,
    required this.clasificadorMonto,
  });

  NewLiquidacionSuccessState copyWith({
    List<ClasificadorEntity>? clasificadores,
    List<Map<String, dynamic>>? clasificadorMonto,
  }) {
    return NewLiquidacionSuccessState(
      clasificadores: clasificadores ?? this.clasificadores,
      clasificadorMonto: clasificadorMonto ?? this.clasificadorMonto,
    );
  }

  @override
  List<Object> get props => [this.clasificadorMonto, this.clasificadores];
}
