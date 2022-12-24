// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'requerimiento_detail_bloc.dart';

abstract class RequerimientoDetailEvent extends Equatable {
  const RequerimientoDetailEvent();

  @override
  List<Object> get props => [];
}

class RequerimientoDetailLoad extends RequerimientoDetailEvent {
  final List<RequerimientoDetalleEntity> requerimientoDetail;
  RequerimientoDetailLoad({
    required this.requerimientoDetail,
  });

  @override
  List<Object> get props => [this.requerimientoDetail];
}
