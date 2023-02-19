// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'requerimiento_list_bloc.dart';

abstract class RequerimientoListEvent extends Equatable {
  const RequerimientoListEvent();

  List<Object> get props => [];
}

class RequerimientoListLoadEvent extends RequerimientoListEvent {}

class RequerimientoSetDetailEvent extends RequerimientoListEvent {
  final List<RequerimientoDetalleEntity> reqrerimientoDetail;
  RequerimientoSetDetailEvent({
    required this.reqrerimientoDetail,
  });
}
