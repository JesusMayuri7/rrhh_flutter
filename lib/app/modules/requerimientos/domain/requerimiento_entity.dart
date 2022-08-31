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
    required this.descArea,
    required this.requerimientoDetalle,
  });

  final int anio;
  final int id;
  final String dscModalidad;
  final String nroExpediente;
  final String dctoSolicitud;
  final DateTime fechaSolicitud;
  final String descArea;
  final List<DocumentoDetalleEntity> requerimientoDetalle;

  @override
  List<Object> get props {
    return [
      anio,
      id,
      dscModalidad,
      nroExpediente,
      dctoSolicitud,
      fechaSolicitud,
      descArea,
      requerimientoDetalle,
    ];
  }
}
