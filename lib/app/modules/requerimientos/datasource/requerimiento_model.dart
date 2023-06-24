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
      required tipoRequerimientoId,
      required descTipoRequerimiento,
      required presupuesto,
      required nroExpediente,
      required dctoSolicitud,
      required fechaSolicitud,
      required areaId,
      required descArea,
      required modalidadId,
      required cantidad,
      required List<RequerimientoDetalleModel> requerimientoDetalle})
      : super(
            anio: anio,
            id: id,
            dscModalidad: dscModalidad,
            tipoRequerimientoId: tipoRequerimientoId,
            descTipoRequerimiento: descTipoRequerimiento,
            presupuesto: presupuesto,
            nroExpediente: nroExpediente,
            dctoSolicitud: dctoSolicitud,
            fechaSolicitud: fechaSolicitud,
            descArea: descArea,
            areaId: areaId,            
            modalidadId: modalidadId,
            cantidad: cantidad,
            requerimientoDetalle: requerimientoDetalle);

  factory RequerimientoModel.fromJson(Map<String, dynamic> json) =>
      RequerimientoModel(
        anio: json["anio"],
        id: json["id"],
        tipoRequerimientoId: json["tipo_requerimiento_id"] ?? 0,
        descTipoRequerimiento: json["desc_tipo_requerimiento"] ?? '',
        dscModalidad: json["dsc_modalidad"] ?? '',
        presupuesto: json["presupuesto"] ?? '',
        nroExpediente: json["nro_expediente"] ?? '',
        dctoSolicitud: json["dcto_solicitud"] ?? '',
        fechaSolicitud: json["fecha_solicitud"] ?? '',
        descArea: json["desc_area_req"] ?? '',
        areaId: json['area_id'] ?? 0,
        requerimientoDetalle: requerimientoDetalleModelFromJson(
            json["requerimiento_detalle"] ?? []),        
        cantidad: json['cantidad'] ?? 0,
        modalidadId: json['modalidad_id'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "id": id,
        "dsc_modalidad": dscModalidad,
        "desc_tipo_requerimiento": descTipoRequerimiento,
        "tipo_requerimiento_id": tipoRequerimientoId,
        "nro_expediente": nroExpediente,
        "dcto_solicitud": dctoSolicitud,
        "fecha_solicitud": fechaSolicitud,
        "desc_area": descArea,
        "area_id": areaId,
        "cantidad": cantidad,
        "requerimientoDetalle": requerimientoDetalle
      };
}
