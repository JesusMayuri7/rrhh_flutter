// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

part 'requerimiento_new_event.dart';
part 'requerimiento_new_state.dart';

class RequerimientoNewBloc
    extends Bloc<RequerimientoNewEvent, RequerimientoNewState> {
  RequerimientoNewBloc() : super(RequerimientoNew(newParamsRequerimiento: null,newParamsRequerimientoDetalle: [])) {
    on<AddRequerimientoDetalleEvent>(_addRequerimientoDetalleEvent);
    on<DelRequerimientoDetalleEvent>(_delRequerimientoDetalleEvent);
  }

  _addRequerimientoDetalleEvent(AddRequerimientoDetalleEvent event, Emitter<RequerimientoNewState> emit) {

    List<NewParamsRequerimientoDetalle> requerimientoDetalles =[];

    //final requerimientoDetalle = state.newParamsRequerimiento == null ? []: state.newParamsRequerimiento?.requerimientoDetalle;
    //NewParamsRequerimiento requerimiento = state.newParamsRequerimiento ?? event.paramsNewRequerimiento;
    requerimientoDetalles = List.of((state as RequerimientoNew).newParamsRequerimientoDetalle);
    requerimientoDetalles.add(event.paramsNewRequerimientoDetalle);         
   

    //List<NewParamsRequerimientoDetalle> detalle =  List<NewParamsRequerimientoDetalle>.of([...requerimientoDetalles,event.paramsNewRequerimientoDetalle]);
   
    
    emit(RequerimientoNew(newParamsRequerimientoDetalle: requerimientoDetalles, newParamsRequerimiento: null));         
  }

  _delRequerimientoDetalleEvent(DelRequerimientoDetalleEvent event, Emitter<RequerimientoNewState> emit) async {

  }
}

class NewParamsRequerimiento {
  int? id;
  String anio;
  String? expedientePvn;
  String? documentoPvn;
  String? fechaDocumento;
  AreaEntity? orgArea;
  MetaEntity? meta;
  FuenteEntity? fuente;
  ModalidadEntity? modalidad;
  List<NewParamsRequerimientoDetalle> requerimientoDetalle;

  NewParamsRequerimiento({
    this.id,
    required this.anio,
    this.expedientePvn = '',
    this.documentoPvn = '',
    this.fechaDocumento = '',
    this.orgArea,
    this.meta,
    this.fuente,
    this.modalidad,
    this.requerimientoDetalle = const [],
  });

  @override
  String toString() {
    return '''NewParamsRequerimiento(id: $id, anio: $anio, expedientePvn: $expedientePvn, documentoPvn: $documentoPvn, 
    fechaDocumento: $fechaDocumento, orgArea: $orgArea, meta: $meta, fuente: $fuente, modalidad: $modalidad, requerimientoDetalle: $requerimientoDetalle)''';
  }

  NewParamsRequerimiento copyWith({
    int? id,
    String? anio,
    String? expedientePvn,
    String? documentoPvn,
    String? fechaDocumento,
    AreaEntity? orgArea,
    MetaEntity? meta,
    FuenteEntity? fuente,
    ModalidadEntity? modalidad,
    List<NewParamsRequerimientoDetalle>? requerimientoDetalle,
  }) {
    return NewParamsRequerimiento(
      id: id ?? this.id,
      anio: anio ?? this.anio,
      expedientePvn: expedientePvn ?? this.expedientePvn,
      documentoPvn: documentoPvn ?? this.documentoPvn,
      fechaDocumento: fechaDocumento ?? this.fechaDocumento,
      orgArea: orgArea ?? this.orgArea,
      meta: meta ?? this.meta,
      fuente: fuente ?? this.fuente,
      modalidad: modalidad ?? this.modalidad,
      requerimientoDetalle: requerimientoDetalle ?? this.requerimientoDetalle,
    );
  }
}


class NewParamsRequerimientoDetalle extends Equatable {
  NewParamsRequerimientoDetalle({
    this.cargo ='',
    this.monto = 0,
    this.cantidad = 0,
    this.areaId = 0,
    this.descArea = '',
    this.id = 0,
    this.fuenteId = 0,
    this.descFuente = '',
    this.metaId = 0,
    this.descMeta = '',
  });

  String cargo;
  num monto;
  int cantidad;
  int areaId;
  String descArea;
  int id;
  int fuenteId;
  String descFuente;
  int metaId;
  String descMeta;
  
  @override
  List<Object?> get props => [this.cargo,this.monto,this.cantidad,this.areaId,this.descArea,this.id,this.fuenteId,this.descFuente,this.metaId,this.descMeta];
  

}
