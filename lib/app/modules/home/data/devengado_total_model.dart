// To parse this JSON data, do
//
//     final devengadoTotalModel = devengadoTotalModelFromJson(jsonString);

import 'dart:convert';

import 'package:rrhh_clean/app/modules/home/domain/devengado_total_entity.dart';

List<DevengadoTotalModel> devengadoTotalModelFromJson(String str) =>
    List<DevengadoTotalModel>.from(
        json.decode(str).map((x) => DevengadoTotalModel.fromJson(x)));

String devengadoTotalModelToJson(List<DevengadoTotalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DevengadoTotalModel extends DevengadoTotalEntity {
  DevengadoTotalModel({
    required int anio,
    required String dscModalidad,
    required String mes,
    required double monto,
    required double total,
  }) : super(
            anio: anio,
            dscModalidad: dscModalidad,
            mes: mes,
            monto: monto,
            total: total);

  factory DevengadoTotalModel.fromJson(Map<String, dynamic> json) =>
      DevengadoTotalModel(
        anio: json["anio"],
        dscModalidad: json["dsc_modalidad"],
        mes: json["mes"],
        monto: (json["monto"] ?? 0).toDouble(),
        total: (json["total"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "dsc_modalidad": dscModalidad,
        "mes": mes,
        "monto": monto,
        "total": total
      };
}
