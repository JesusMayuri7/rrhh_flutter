import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {}

class InitialAppState extends AppState {
  @override
  List<Object?> get props => [];
}

class AppAnioSelectedState extends AppState {
  final String anioSelected;
  final bool isLogged;

  AppAnioSelectedState({
    required this.anioSelected,
    this.isLogged = false,
  });

  @override
  List<Object?> get props => [anioSelected, this.isLogged];
}
