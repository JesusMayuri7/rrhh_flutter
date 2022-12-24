// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String newFuente;

  AltaBajaPracLoaded({
    required this.practicanteBajaId,
    required this.practicanteEntity,
    required this.newFuente,
  });
  @override
  List<Object> get props =>
      [this.practicanteBajaId, this.practicanteEntity, this.newFuente];
}

class AltaBajaPracError extends AltaBajaPracState {
  final String message;
  AltaBajaPracError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
