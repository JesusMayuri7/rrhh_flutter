part of 'requerimiento_list_bloc.dart';

abstract class RequerimientoListState extends Equatable {
  const RequerimientoListState();
}

class RequerimientoListInitial extends RequerimientoListState {
  @override
  List<Object> get props => [];
}

class RequerimientoListLoading extends RequerimientoListState {
  @override
  List<Object> get props => [];
}

class RequerimientoListLoaded extends RequerimientoListState {
  final List<RequerimientoEntity> requerimientoList;

  RequerimientoListLoaded({
    required this.requerimientoList,
  });
  @override
  List<Object> get props => [this.requerimientoList];
}

class RequerimientoSetDetailState extends RequerimientoListState {
  final List<RequerimientoDetalleEntity> requerimientoDetail;
  
  RequerimientoSetDetailState({
    required this.requerimientoDetail,
  });
  @override
  List<Object> get props => [this.requerimientoDetail];
}
