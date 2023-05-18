// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';

class RequerimientoEntity extends Equatable {
  RequerimientoEntity({
    required this.anio,
    required this.id,
    required this.dscModalidad,
    required this.presupuesto,
    required this.nroExpediente,
    required this.dctoSolicitud,
    required this.fechaSolicitud,
    required this.unidadId,
    required this.descUnidad,
    required this.metaId,
    required this.descMeta,
    required this.fuenteId,
    required this.modalidadId,
    required this.descFuente,
    required this.cantidad,
    required this.requerimientoDetalle,
  });

  final String anio;
  final int id;
  final String dscModalidad;
  final int modalidadId;
  final String presupuesto;
  final String nroExpediente;
  final String dctoSolicitud;
  final String fechaSolicitud;
  final String descUnidad;
  final int unidadId;
  final String descMeta;
  final int metaId;
  final String descFuente;
  final int fuenteId;  
  final int cantidad;
  final List<RequerimientoDetalleEntity> requerimientoDetalle;

  @override
  List<Object> get props {
    return [
      anio,
      id,
      dscModalidad,
      presupuesto,
      nroExpediente,
      dctoSolicitud,
      fechaSolicitud,
      descUnidad,
      unidadId,
      descMeta,
      metaId,
      descFuente,
      fuenteId,
      modalidadId,
      cantidad,
      requerimientoDetalle,
    ];
  }

  RequerimientoEntity copyWith({
    String? anio,
    int? id,
    String? dscModalidad,
    int? modalidadId,
    String? presupuesto,
    String? nroExpediente,
    String? dctoSolicitud,
    String? fechaSolicitud,
    String? descUnidad,
    int? unidadId,
    String? descMeta,
    int? metaId,
    String? descFuente,
    int? fuenteId,
    int? cantidad,
    List<RequerimientoDetalleEntity>? requerimientoDetalle,
  }) {
    return RequerimientoEntity(
      anio: anio ?? this.anio,
      id: id ?? this.id,
      dscModalidad: dscModalidad ?? this.dscModalidad,
      modalidadId: modalidadId ?? this.modalidadId,
      presupuesto: presupuesto ?? this.presupuesto,
      nroExpediente: nroExpediente ?? this.nroExpediente,
      dctoSolicitud: dctoSolicitud ?? this.dctoSolicitud,
      fechaSolicitud: fechaSolicitud ?? this.fechaSolicitud,
      descUnidad: descUnidad ?? this.descUnidad,
      unidadId: unidadId ?? this.unidadId,
      descMeta: descMeta ?? this.descMeta,
      metaId: metaId ?? this.metaId,
      descFuente: descFuente ?? this.descFuente,
      fuenteId: fuenteId ?? this.fuenteId,
      cantidad: cantidad ?? this.cantidad,
      requerimientoDetalle: requerimientoDetalle ?? this.requerimientoDetalle,
    );
  }
}
