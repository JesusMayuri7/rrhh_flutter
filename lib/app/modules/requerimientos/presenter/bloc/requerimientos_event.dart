// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'requerimientos_bloc.dart';

abstract class RequerimientosEvent extends Equatable {
  const RequerimientosEvent();

  @override
  List<Object> get props => [];
}

class RequerimientosLoadEvent extends RequerimientosEvent {
  final String anio;

  RequerimientosLoadEvent({
    required this.anio,
  });

    @override
  List<Object> get props => [this.anio];
}
