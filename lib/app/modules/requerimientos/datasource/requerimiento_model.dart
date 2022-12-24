import 'dart:convert';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';

import 'requerimiento_detalle_model.dart';

List<RequerimientoModel> requerimientoModelFromJson(String str) =>
    List<RequerimientoModel>.from(
        json.decode(str).map((x) => RequerimientoModel.fromJson(x)));

String requerimientoModelToJson(List<RequerimientoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimientoModel extends RequerimientoEntity {
  RequerimientoModel(
      {required anio,
      required id,
      required dscModalidad,
      required nroExpediente,
      required dctoSolicitud,
      required fechaSolicitud,
      required areaId,
      required descArea,
      required metaId,
      required descMeta,
      required fuenteId,
      required descFuente,
      required modalidadId,
      required List<RequerimientoDetalleModel> requerimientoDetalle})
      : super(
            anio: anio,
            id: id,
            dscModalidad: dscModalidad,
            nroExpediente: nroExpediente,
            dctoSolicitud: dctoSolicitud,
            fechaSolicitud: fechaSolicitud,
            descArea: descArea,
            areaId: areaId,
            metaId: metaId,
            descMeta: descMeta,
            fuenteId: fuenteId,
            descFuente: descFuente,
            modalidadId: modalidadId,
            requerimientoDetalle: requerimientoDetalle);

  factory RequerimientoModel.fromJson(Map<String, dynamic> json) =>
      RequerimientoModel(
          anio: json["anio"],
          id: json["id"],
          dscModalidad: json["dsc_modalidad"] ?? '',
          nroExpediente: json["nro_expediente"] ?? '',
          dctoSolicitud: json["dcto_solicitud"] ?? '',
          fechaSolicitud: json["fecha_solicitud"] ?? '',
          descArea: json["desc_area"] ?? '',
          areaId: json['area_id'] ?? 0,
          requerimientoDetalle: requerimientoDetalleModelFromJson(
              json["requerimiento_detalle"] ?? []),
          descFuente: json['desc_fuente'] ?? '',
          descMeta: json['desc_metaa'] ?? '',
          fuenteId: json['fuente_id'] ?? 0,
          metaId: json['meta_id'] ?? 0,
          modalidadId: json['modalidad_id'] ?? 0,
          
          );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "id": id,
        "dsc_modalidad": dscModalidad,
        "nro_expediente": nroExpediente,
        "dcto_solicitud": dctoSolicitud,
        "fecha_solicitud": fechaSolicitud,
        "desc_area": descArea,
        "area_id": areaId,
        "requerimientoDetalle": requerimientoDetalle
      };
}
