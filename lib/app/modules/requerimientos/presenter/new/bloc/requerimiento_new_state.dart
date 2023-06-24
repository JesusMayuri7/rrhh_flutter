// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'requerimiento_new_bloc.dart';

abstract class RequerimientoNewState extends Equatable {
  final NewParamsRequerimiento? newParamsRequerimiento;
  final List<NewParamsRequerimientoDetalle> newParamsRequerimientoDetalle;
  final StatusNewRequerimiento statusNewRequerimiento;
  
  RequerimientoNewState({
    required this.newParamsRequerimiento,
    required this.newParamsRequerimientoDetalle,
    this.statusNewRequerimiento = StatusNewRequerimiento.initial,
  });

    @override
  List<Object?> get props => []; 
}

class RequerimientoNew extends RequerimientoNewState {
  RequerimientoNew({
    required super.newParamsRequerimiento, 
    required super.newParamsRequerimientoDetalle,
    super.statusNewRequerimiento = StatusNewRequerimiento.initial });
  
  @override
  List<Object?> get props => [this.newParamsRequerimiento,this.newParamsRequerimientoDetalle,this.statusNewRequerimiento]; 

  RequerimientoNew copyWith({
      NewParamsRequerimiento? newParamsRequerimiento,
      List<NewParamsRequerimientoDetalle>? newParamsRequerimientoDetalle,
      StatusNewRequerimiento? statusNewRequerimiento
  }) {
        return RequerimientoNew(
      newParamsRequerimiento: newParamsRequerimiento ?? this.newParamsRequerimiento,
      newParamsRequerimientoDetalle: newParamsRequerimientoDetalle ?? this.newParamsRequerimientoDetalle,
      statusNewRequerimiento: statusNewRequerimiento ?? this.statusNewRequerimiento,
    );
  }
}

enum StatusNewRequerimiento {
   initial('INITIAL'),
   loaded('LOADED'),
   error('ERROR'),
   saved('SAVED');

   final String status;

   const StatusNewRequerimiento(this.status);
}

