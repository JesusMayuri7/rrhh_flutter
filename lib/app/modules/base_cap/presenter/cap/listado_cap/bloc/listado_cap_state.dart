part of 'listado_cap_bloc.dart';

abstract class ListadoCapState extends Equatable {
  const ListadoCapState();

  @override
  List<Object> get props => [];
}

class ListadoCapInitial extends ListadoCapState {}

class ListadoCapLoading extends ListadoCapState {}

class ListadoCapLoaded extends ListadoCapState {
  final List<BaseCapEntity> listadoCap;
  ListadoCapLoaded({
    required this.listadoCap,
  });

  ListadoCapLoaded copyWith({
    List<BaseCapEntity>? listadoCap,
  }) {
    return ListadoCapLoaded(
      listadoCap: listadoCap ?? this.listadoCap,
    );
  }

  @override
  List<Object> get props => [this.listadoCap];

  @override
  String toString() => 'ListadoCapLoaded(listadoCap: $listadoCap)';
}

class ListadoCapError extends ListadoCapState {
  final String message;
  ListadoCapError({
    required this.message,
  });
}
