part of 'new_liquidacion_bloc.dart';

abstract class NewLiquidacionState extends Equatable {
  const NewLiquidacionState();

  @override
  List<Object> get props => [];
}

enum AddLiquidacionStatus {
  Initial,
  Loaded,
  ClasificadorLoaded,
  ClasificadorAded,
  Saved,
  Failure
}

class NewLiquidacionInitial extends NewLiquidacionState {}

class NewLiquidacionSuccessState extends NewLiquidacionState {
  final List<Map<String, dynamic>> clasificadorMonto;
  final List<ClasificadorEntity> clasificadores;
  final AddLiquidacionStatus status;
  final num total;
  NewLiquidacionSuccessState({
    this.status = AddLiquidacionStatus.Initial,
    this.total = 0,
    required this.clasificadores,
    required this.clasificadorMonto,
  });

  NewLiquidacionSuccessState copyWith(
      {List<ClasificadorEntity>? clasificadores,
      List<Map<String, dynamic>>? clasificadorMonto,
      AddLiquidacionStatus? status,
      num? total}) {
    return NewLiquidacionSuccessState(
      total: total ?? this.total,
      status: status ?? this.status,
      clasificadores: clasificadores ?? this.clasificadores,
      clasificadorMonto: clasificadorMonto ?? this.clasificadorMonto,
    );
  }

  @override
  List<Object> get props =>
      [this.clasificadorMonto, this.clasificadores, this.status, this.total];
}
