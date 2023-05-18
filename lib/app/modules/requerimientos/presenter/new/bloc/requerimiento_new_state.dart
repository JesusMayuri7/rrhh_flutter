// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'requerimiento_new_bloc.dart';

abstract class RequerimientoNewState extends Equatable {
  final RequerimientoEntity? requerimientoEntity;
  final StatusNewRequerimiento statusNewRequerimiento;
  

  RequerimientoNewState({
    required this.requerimientoEntity,
    this.statusNewRequerimiento = StatusNewRequerimiento.initial,
  });



}

class RequerimientoNew extends RequerimientoNewState {
  RequerimientoNew({required super.requerimientoEntity, super.statusNewRequerimiento = StatusNewRequerimiento.initial });
  
  @override
  List<Object?> get props => [this.requerimientoEntity,this.statusNewRequerimiento]; 

  RequerimientoNew copyWith({
      RequerimientoEntity? requerimientoEntity,StatusNewRequerimiento? statusNewRequerimiento
  }) {
        return RequerimientoNew(
      requerimientoEntity: requerimientoEntity ?? this.requerimientoEntity,
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

