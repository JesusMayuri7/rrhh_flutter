// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'requerimiento_detail_bloc.dart';

abstract class RequerimientoDetailState extends Equatable {
  const RequerimientoDetailState();

  @override
  List<Object> get props => [];
}

class RequerimientoDetailInitial extends RequerimientoDetailState {}

class RequerimientoDetailLoaded extends RequerimientoDetailState {
  final List<RequerimientoDetalleEntity> requerimientoDetail;
  RequerimientoDetailLoaded({
    required this.requerimientoDetail,
  });

  @override
  List<Object> get props => [this.requerimientoDetail];
}
