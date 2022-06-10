part of 'base_prac_bloc.dart';

abstract class BasePracState extends Equatable {
  const BasePracState();

  @override
  List<Object> get props => [];
}

class BasePracInitialState extends BasePracState {}

class BasePracLoadedState extends BasePracState {
  final List<FuenteEntity> fuentes;
  final List<MetaEntity> metas;
  final List<AreaEntity> areas;
  BasePracLoadedState({
    required this.fuentes,
    required this.metas,
    required this.areas,
  });

  @override
  List<Object> get props => [this.fuentes, this.metas, this.areas];

  @override
  String toString() =>
      'BasePracLoadedState(fuentes: $fuentes, metas: $metas, areas: $areas)';
}

class BasePracLoadingState extends BasePracState {}

class BasePracErrorState extends BasePracState {
  final String message;
  BasePracErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
