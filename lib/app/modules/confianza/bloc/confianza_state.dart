part of 'confianza_bloc.dart';

abstract class ConfianzaState extends Equatable {
  const ConfianzaState();

  @override
  List<Object> get props => [];
}

class ConfianzaInitial extends ConfianzaState {}

class ConfianzaAreaStateLoaded extends ConfianzaState {
  final List<AreaEntity> listAreas;
  ConfianzaAreaStateLoaded({
    required this.listAreas,
  });
}

class ConfianzaAreaStateLoading extends ConfianzaState {}

class ConfianzaAreaStateError extends ConfianzaState {}
