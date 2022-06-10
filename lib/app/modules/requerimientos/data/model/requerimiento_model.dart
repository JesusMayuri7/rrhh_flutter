import 'dart:convert';

import 'package:rrhh_clean/app/modules/requerimientos/data/model/requerimiento_detalle_model.dart';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';

List<RequerimientoModel> requerimientoModelFromJson(String str) =>
    List<RequerimientoModel>.from(
        json.decode(str).map((x) => RequerimientoModel.fromJson(x)));

String requerimientoModelToJson(List<RequerimientoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimientoModel extends RequerimientoEntity {
  RequerimientoModel(
      {required int anio,
      required int id,
      required String dscModalidad,
      required String nroExpediente,
      required String dctoSolicitud,
      required DateTime fechaSolicitud,
      required String descArea,
      required List<RequerimientoDetalleModel> requerimientoDetalle})
      : super(
            anio: anio,
            id: id,
            dscModalidad: dscModalidad,
            nroExpediente: nroExpediente,
            dctoSolicitud: dctoSolicitud,
            fechaSolicitud: fechaSolicitud,
            descArea: descArea,
            requerimientoDetalle: requerimientoDetalle);

  factory RequerimientoModel.fromJson(Map<String, dynamic> json) =>
      RequerimientoModel(
          anio: json["anio"],
          id: json["id"],
          dscModalidad: json["dsc_modalidad"],
          nroExpediente: json["nro_expediente"],
          dctoSolicitud: json["dcto_solicitud"],
          fechaSolicitud: DateTime.parse(json["fecha_solicitud"]),
          descArea: json["desc_area"],
          requerimientoDetalle:
              requerimientoDetalleModelFromJson(json["requerimiento_detalle"]));

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "id": id,
        "dsc_modalidad": dscModalidad,
        "nro_expediente": nroExpediente,
        "dcto_solicitud": dctoSolicitud,
        "fecha_solicitud":
            "${fechaSolicitud.year.toString().padLeft(4, '0')}-${fechaSolicitud.month.toString().padLeft(2, '0')}-${fechaSolicitud.day.toString().padLeft(2, '0')}",
        "desc_area": descArea,
        "requerimientoDetalle": requerimientoDetalle
      };
}
