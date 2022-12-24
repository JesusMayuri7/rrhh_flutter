// ignore_for_file: public_member_api_docs, sort_constructors_first
//part of 'Requerimientos_cubit.dart';
part of 'requerimientos_bloc.dart';

abstract class RequerimientosState extends Equatable {
  const RequerimientosState();

  @override
  List<Object> get props => [];
}

class RequerimientosInitial extends RequerimientosState {}

class RequerimientosLoading extends RequerimientosState {}

class RequerimientosError extends RequerimientosState {
  final String message;
  RequerimientosError({
    required this.message,
  });
}

class RequerimientosLoaded extends RequerimientosState {
  final List<MetaEntity> metas;
  final List<FuenteEntity> fuentes;
  final List<AreaEntity> areas;
  final List<ModalidadEntity> modalidades;
  RequerimientosLoaded(
      {required this.areas,
      required this.metas,
      required this.fuentes,
      required this.modalidades});

  List<Object> get props =>
      [this.metas, this.fuentes, this.areas, this.modalidades];
}
