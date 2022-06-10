import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StartState extends Equatable {
  const StartState();

  @override
  List<Object> get props => [];
}

class InitialStartState extends StartState {
  final int totalPlazas = 0;

  InitialStartState({required totalPlazas});

  @override
  List<Object> get props => [totalPlazas];
}

class TotalPlazasState extends StartState {
  final int totalPlazas = 0;

  TotalPlazasState({required totalPlazas});

  @override
  List<Object> get props => [totalPlazas];
}
