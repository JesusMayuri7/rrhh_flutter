part of 'new_judicial_bloc.dart';

abstract class NewJudicialState extends Equatable {
  const NewJudicialState();

  @override
  List<Object> get props => [];
}

class NewJudicialInitial extends NewJudicialState {}

class NewJudicialSaved extends NewJudicialState {
  final JudicialEntity judicialEntity;

  NewJudicialSaved({required this.judicialEntity});

  @override
  List<Object> get props => [this.judicialEntity];
}

class NewJudicialError extends NewJudicialState {
  final String message;

  NewJudicialError({required this.message});
  @override
  List<Object> get props => [this.message];
}
