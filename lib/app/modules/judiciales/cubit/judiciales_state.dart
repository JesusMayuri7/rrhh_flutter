// ignore_for_file: public_member_api_docs, sort_constructors_first
//part of 'judiciales_cubit.dart';
part of 'judiciales_bloc.dart';

abstract class JudicialesState extends Equatable {
  const JudicialesState();

  @override
  List<Object> get props => [];
}

class JudicialesInitial extends JudicialesState {}

class JudicialesLoading extends JudicialesState {}

class JudicialesError extends JudicialesState {
  final String message;
  JudicialesError({
    required this.message,
  });
}

class JudicialesLoaded extends JudicialesState {
  final List<MetaEntity> metas;
  final List<FuenteEntity> fuentes;
  final List<AreaEntity> areas;
  JudicialesLoaded({
    required this.areas,
    required this.metas,
    required this.fuentes,
  });

  List<Object> get props => [this.metas, this.fuentes, this.areas];
}
