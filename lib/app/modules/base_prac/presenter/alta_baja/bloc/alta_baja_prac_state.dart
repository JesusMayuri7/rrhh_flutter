part of 'alta_baja_prac_bloc.dart';

abstract class AltaBajaPracState extends Equatable {
  const AltaBajaPracState();
}

class AltaBajaPracLoading extends AltaBajaPracState {
  @override
  List<Object> get props => [];
}

class AltaBajaPracLoaded extends AltaBajaPracState {
  final int practicanteBajaId;
  final PracticanteEntity practicanteEntity;

  AltaBajaPracLoaded({
    required this.practicanteBajaId,
    required this.practicanteEntity,
  });
  @override
  List<Object> get props => [this.practicanteBajaId, this.practicanteEntity];
}

class AltaBajaPracError extends AltaBajaPracState {
  final String message;
  AltaBajaPracError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
