// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';

class RequerimientoEntity extends Equatable {
  RequerimientoEntity({
    required this.anio,
    required this.id,
    required this.dscModalidad,
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
  final String nroExpediente;
  final String dctoSolicitud;
  final String fechaSolicitud;
  final String descUnidad;
  final int unidadId;
  final String descMeta;
  final int metaId;
  final String descFuente;
  final int fuenteId;
  final int modalidadId;
  final int cantidad;
  final List<RequerimientoDetalleEntity> requerimientoDetalle;

  @override
  List<Object> get props {
    return [
      anio,
      id,
      dscModalidad,
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
}
