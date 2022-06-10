part of 'listado_cap_bloc.dart';

abstract class ListadoCapEvent extends Equatable {
  const ListadoCapEvent();

  @override
  List<Object> get props => [];
}

class CapLoadEvent extends ListadoCapEvent {
  final String anio;
  CapLoadEvent({
    required this.anio,
  });
}
