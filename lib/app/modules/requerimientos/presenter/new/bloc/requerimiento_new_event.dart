// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'requerimiento_new_bloc.dart';

abstract class RequerimientoNewEvent extends Equatable {
  const RequerimientoNewEvent();

  @override
  List<Object> get props => [];
}

class AddRequerimientoDetalleEvent extends RequerimientoNewEvent {
   final NewParamsRequerimiento paramsNewRequerimiento;
   final NewParamsRequerimientoDetalle paramsNewRequerimientoDetalle;

  AddRequerimientoDetalleEvent({
    required this.paramsNewRequerimiento,
    required this.paramsNewRequerimientoDetalle,
  });
  
    @override
  List<Object> get props => [this.paramsNewRequerimiento,this.paramsNewRequerimientoDetalle];
}

class DelRequerimientoDetalleEvent extends RequerimientoNewEvent {

final int deleteItemRequerimiento;

  DelRequerimientoDetalleEvent({
    required this.deleteItemRequerimiento    
  });
  
    @override
  List<Object> get props => [this.deleteItemRequerimiento];
}
