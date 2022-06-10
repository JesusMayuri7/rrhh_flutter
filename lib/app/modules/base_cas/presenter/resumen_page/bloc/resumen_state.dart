part of 'resumen_bloc.dart';

abstract class ResumenState extends Equatable {
  const ResumenState();
}

class ResumenInitial extends ResumenState {
  @override
  List<Object?> get props => [];
}

class ResumenLoading extends ResumenState {
  @override
  List<Object?> get props => [];
}

class ResumenError extends ResumenState {
  final String message;
  ResumenError({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class ResumenLoaded extends ResumenState {
  final List<ResumenEntity> resumenCasList;
  ResumenLoaded({
    required this.resumenCasList,
  });

  @override
  List<Object?> get props => [resumenCasList];

  ResumenLoaded copyWith({
    List<ResumenEntity>? resumenCasList,
  }) {
    return ResumenLoaded(
      resumenCasList: resumenCasList ?? this.resumenCasList,
    );
  }
}
