// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';

class RequerimientoEntity extends Equatable {
  RequerimientoEntity({
    required this.anio,
    required this.id,
    required this.dscModalidad,
    required this.tipoRequerimientoId,
    required this.descTipoRequerimiento,
    required this.presupuesto,
    required this.nroExpediente,
    required this.dctoSolicitud,
    required this.fechaSolicitud,
    required this.descArea,
    required this.areaId,
    required this.modalidadId,

    required this.cantidad,
    required this.requerimientoDetalle,
  });

  final String anio;
  final int id;
  final String dscModalidad;
  final int tipoRequerimientoId;
  final String descTipoRequerimiento;
  final int modalidadId;
  final String presupuesto;
  final String nroExpediente;
  final String dctoSolicitud;
  final String fechaSolicitud;
  final String descArea;
  final int areaId;
  
  final int cantidad;
  final List<RequerimientoDetalleEntity> requerimientoDetalle;

  @override
  List<Object> get props {
    return [
      anio,
      id,
      dscModalidad,
      tipoRequerimientoId,
      descTipoRequerimiento,
      presupuesto,
      nroExpediente,
      dctoSolicitud,
      fechaSolicitud,

      modalidadId,
      cantidad,
      requerimientoDetalle,
    ];
  }

  RequerimientoEntity copyWith({
    String? anio,
    int? id,
    String? dscModalidad,
    int? tipoRequerimientoId,
    String? descTipoRequerimiento,
    int? modalidadId,
    String? presupuesto,
    String? nroExpediente,
    String? dctoSolicitud,
    String? fechaSolicitud,
    String? descArea,
    int? areaId,        
    int? cantidad,
    List<RequerimientoDetalleEntity>? requerimientoDetalle,
  }) {
    return RequerimientoEntity(
      anio: anio ?? this.anio,
      id: id ?? this.id,
      dscModalidad: dscModalidad ?? this.dscModalidad,
      tipoRequerimientoId: tipoRequerimientoId ?? this.tipoRequerimientoId,
      descTipoRequerimiento: descTipoRequerimiento ?? this.descTipoRequerimiento,
      modalidadId: modalidadId ?? this.modalidadId,
      presupuesto: presupuesto ?? this.presupuesto,
      nroExpediente: nroExpediente ?? this.nroExpediente,
      dctoSolicitud: dctoSolicitud ?? this.dctoSolicitud,
      fechaSolicitud: fechaSolicitud ?? this.fechaSolicitud,
      areaId: areaId ?? this.areaId,
      descArea: descArea ?? this.descArea,
      cantidad: cantidad ?? this.cantidad,
      requerimientoDetalle: requerimientoDetalle ?? this.requerimientoDetalle,
    );
  }
}
