import 'dart:convert';

import '../../domain/judiciales_detalle_entity.dart';

List<JudicialDetalleModel> requerimientoDetalleModelFromJson(String str) =>
    List<JudicialDetalleModel>.from(
        json.decode(str).map((x) => JudicialDetalleModel.fromJson(x)));

String requerimientoDetalleModelToJson(List<JudicialDetalleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JudicialDetalleModel extends JudicialDetalleEntity {
  JudicialDetalleModel(
      {required final String cargo,
      required final int monto,
      required final int cantidad,
      required final int subAreaId,
      required final String descSubarea,
      required final int requerimientoId})
      : super(
          cargo: cargo,
          monto: monto,
          cantidad: cantidad,
          subAreaId: subAreaId,
          descSubarea: descSubarea,
          requerimientoId: requerimientoId,
        );

  factory JudicialDetalleModel.fromJson(Map<String, dynamic> json) =>
      JudicialDetalleModel(
        cargo: json["cargo"],
        monto: json["monto"],
        cantidad: json["cantidad"],
        subAreaId: json["sub_area_id"],
        descSubarea: json["desc_subarea"],
        requerimientoId: json["requerimiento_id"],
      );

  Map<String, dynamic> toJson() => {
        "cargo": cargo,
        "monto": monto,
        "cantidad": cantidad,
        "sub_area_id": subAreaId,
        "desc_subarea": descSubarea,
        "requerimiento_id": requerimientoId,
      };
}
