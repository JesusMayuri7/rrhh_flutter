part of 'homedevengadototal_bloc.dart';

abstract class HomeDevengadoTotalState extends Equatable {
  const HomeDevengadoTotalState();
}

class HomeDevengadoTotalLoading extends HomeDevengadoTotalState {
  @override
  List<Object?> get props => [];
}

class HomeDevengadoTotalError extends HomeDevengadoTotalState {
  final String message;
  HomeDevengadoTotalError({
    required this.message,
  });
  @override
  List<Object> get props => [this.message];
}

class HomedevengadototalLoaded extends HomeDevengadoTotalState {
  final List<DevengadoTotalEntity> devengadoTotal;
  final List<CapEstadoOppEntity> capEstadoOpp;

  HomedevengadototalLoaded({
    this.capEstadoOpp = const [],
    this.devengadoTotal = const [],
  });

  @override
  List<Object> get props => [this.capEstadoOpp, this.devengadoTotal];
}
