import 'dart:convert';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';

List<RequerimientoDetalleModel> requerimientoDetalleModelFromJson(String str) =>
    List<RequerimientoDetalleModel>.from(
        json.decode(str).map((x) => RequerimientoDetalleModel.fromJson(x)));

String requerimientoDetalleModelToJson(List<RequerimientoDetalleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimientoDetalleModel extends RequerimientoDetalleEntity {
  RequerimientoDetalleModel(
      {
      required String cargo,
      required num monto,
      required int cantidad,
      required int areaId,
      required String descArea,
      required int id,
      required int fuenteId,
      required String descFuente,
      required int metaId,
      required String descMeta})
      : super(
            cargo: cargo,
            monto: monto,
            cantidad: cantidad,
            areaId: areaId,
            descArea: descArea,
            id: id,
            descFuente: descFuente,
            descMeta: descMeta,
            fuenteId: fuenteId,
            metaId: metaId);

  factory RequerimientoDetalleModel.fromJson(Map<String, dynamic> json) =>
      RequerimientoDetalleModel(
          cargo: json["cargo"] ?? '',
          monto: json["monto"] ?? 0,
          cantidad: json["cantidad"] ?? 0,
          areaId: json["org_area_id"] ?? 0,
          descArea: json["desc_area"] ?? '',
          id: json["id"] ?? 0,
          descFuente: json['desc_fuente'] ?? '',
          descMeta: json['desc_meta'] ?? '',
          fuenteId: json['fuente_id'] ?? 0,
          metaId: json['meta_id'] ?? 0);

  Map<String, dynamic> toJson() => {
        "cargo": cargo,
        "monto": monto,
        "cantidad": cantidad,
        "org_area_id": areaId,
        "desc_area": descArea,
        "id": id,
        "desc_fuente": descFuente,
        "desc_meta": descMeta,
        "fuente_id": fuenteId,
        "meta_id": metaId
      };
}
