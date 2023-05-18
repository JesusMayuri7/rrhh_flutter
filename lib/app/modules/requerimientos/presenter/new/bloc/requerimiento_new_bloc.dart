// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';
import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

part 'requerimiento_new_event.dart';
part 'requerimiento_new_state.dart';

class RequerimientoNewBloc
    extends Bloc<RequerimientoNewEvent, RequerimientoNewState> {
  RequerimientoNewBloc() : super(RequerimientoNew(requerimientoEntity: null)) {
    on<AddRequerimientoDetalleEvent>(_addRequerimientoDetalleEvent);
  }

  _addRequerimientoDetalleEvent(AddRequerimientoDetalleEvent event, Emitter<RequerimientoNewState> emit) async {

    final requerimientoDetalle = state.requerimientoEntity == null ? []: state.requerimientoEntity?.requerimientoDetalle;

    final paramsNewRequerimiento = RequerimientoEntity(anio: event.newParamsRequerimiento.anio, id: event.newParamsRequerimiento.id ?? 0,
    dscModalidad: '', presupuesto: '', 
    nroExpediente: '', dctoSolicitud: '', fechaSolicitud: '', unidadId: 0, 
    descUnidad: '', metaId: 0, descMeta: '', fuenteId: 0, modalidadId: 0, 
    descFuente: '', cantidad: 0, requerimientoDetalle: []);

    final paramsRequerimientoDetalle = RequerimientoDetalleEntity(cargo: event.paramsNewRequerimientoDetalle.cargo,
    monto: event.paramsNewRequerimientoDetalle.monto, cantidad: event.paramsNewRequerimientoDetalle.cantidad, 
    areaId: event.paramsNewRequerimientoDetalle.areaId, descArea: event.paramsNewRequerimientoDetalle.descArea, id: 0, 
    fuenteId: event.paramsNewRequerimientoDetalle.fuenteId, descFuente: event.paramsNewRequerimientoDetalle.descFuente, 
    metaId: event.paramsNewRequerimientoDetalle.metaId, descMeta: event.paramsNewRequerimientoDetalle.descMeta);
    
    print(paramsRequerimientoDetalle);
    print(state.toString());

    final  result = (state as RequerimientoNew).copyWith(requerimientoEntity: 
    (state as RequerimientoNew).requerimientoEntity?.copyWith(requerimientoDetalle: [...requerimientoDetalle!,paramsRequerimientoDetalle]));
    print(result);
     emit(result);
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
    return 'NewParamsRequerimiento(id: $id, anio: $anio, expedientePvn: $expedientePvn, documentoPvn: $documentoPvn, fechaDocumento: $fechaDocumento, orgArea: $orgArea, meta: $meta, fuente: $fuente, modalidad: $modalidad)';
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
