import 'dart:convert';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';

List<RequerimientoDetalleModel> requerimientoDetalleModelFromJson(String str) =>
    List<RequerimientoDetalleModel>.from(
        json.decode(str).map((x) => RequerimientoDetalleModel.fromJson(x)));

String requerimientoDetalleModelToJson(List<RequerimientoDetalleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimientoDetalleModel extends DocumentoDetalleEntity {
  RequerimientoDetalleModel(
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

  factory RequerimientoDetalleModel.fromJson(Map<String, dynamic> json) =>
      RequerimientoDetalleModel(
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
