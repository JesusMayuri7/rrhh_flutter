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
      {
      required anio,
      required id,
      required dscModalidad,
      required presupuesto,
      required nroExpediente,
      required dctoSolicitud,
      required fechaSolicitud,
      required unidadId,
      required descUnidad,
      required metaId,
      required descMeta,
      required fuenteId,
      required descFuente,
      required modalidadId,
      required cantidad,
      required List<RequerimientoDetalleModel> requerimientoDetalle})
      : super(
            anio: anio,
            id: id,
            dscModalidad: dscModalidad,
            presupuesto: presupuesto,
            nroExpediente: nroExpediente,
            dctoSolicitud: dctoSolicitud,
            fechaSolicitud: fechaSolicitud,
            descUnidad: descUnidad,
            unidadId: unidadId,
            metaId: metaId,
            descMeta: descMeta,
            fuenteId: fuenteId,
            descFuente: descFuente,
            modalidadId: modalidadId,
            cantidad: cantidad,
            requerimientoDetalle: requerimientoDetalle);

  factory RequerimientoModel.fromJson(Map<String, dynamic> json) =>
      RequerimientoModel(
        anio: json["anio"],
        id: json["id"],
        dscModalidad: json["dsc_modalidad"] ?? '',
        presupuesto: json["presupuesto"] ?? '',
        nroExpediente: json["nro_expediente"] ?? '',
        dctoSolicitud: json["dcto_solicitud"] ?? '',
        fechaSolicitud: json["fecha_solicitud"] ?? '',
        descUnidad: json["desc_unidad"] ?? '',
        unidadId: json['unidad_id'] ?? 0,
        requerimientoDetalle: requerimientoDetalleModelFromJson(
            json["requerimiento_detalle"] ?? []),
        descFuente: json['desc_fuente'] ?? '',
        descMeta: json['desc_metaa'] ?? '',
        fuenteId: json['fuente_id'] ?? 0,
        metaId: json['meta_id'] ?? 0,
        cantidad: json['cantidad'] ?? 0,
        modalidadId: json['modalidad_id'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "id": id,
        "dsc_modalidad": dscModalidad,
        "nro_expediente": nroExpediente,
        "dcto_solicitud": dctoSolicitud,
        "fecha_solicitud": fechaSolicitud,
        "desc_area": descUnidad,
        "unidad_id": unidadId,
        "cantidad": cantidad,
        "requerimientoDetalle": requerimientoDetalle
      };
}
