// To parse this JSON data, do
//
//     final liquidacionResumenModel = liquidacionResumenModelFromJson(jsonString);

import 'dart:convert';

import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_resumen_entity.dart';

List<LiquidacionResumenModel> liquidacionResumenModelFromJson(String str) {
  List<dynamic> liquidacionJson = json.decode(str);

  return List<LiquidacionResumenModel>.from(
      liquidacionJson.map((x) => LiquidacionResumenModel.fromJson(x)));
}

String liquidacionResumenModelToJson(List<LiquidacionResumenModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LiquidacionResumenModel extends LiquidacionResumenEntity {
  LiquidacionResumenModel({
    required String fuente,
    required String finalidad,
    required String clasificador,
    required String montoCertificado,
    required String montoLiquidacion,
    required String montoDevengado,
    required String montoDevolucion,
    required String saldo,
  }) : super(
            fuente: fuente,
            finalidad: finalidad,
            clasificador: clasificador,
            montoCertificado: montoCertificado,
            montoLiquidacion: montoLiquidacion,
            montoDevengado: montoDevengado,
            montoDevolucion: montoDevolucion,
            saldo: saldo);

  factory LiquidacionResumenModel.fromJson(Map<String, dynamic> json) =>
      LiquidacionResumenModel(
        fuente: json["fuente"] ?? '',
        finalidad: json["finalidad"] ?? '',
        clasificador: json["clasificador"] ?? '',
        montoCertificado: json["monto_certificado"] ?? '0',
        montoLiquidacion: json["monto_liquidacion"] ?? '0',
        montoDevengado: json["monto_devengado"] ?? '0',
        montoDevolucion: json["monto_devolucion"] ?? '0',
        saldo: json["saldo"] ?? '0',
      );

  Map<String, dynamic> toJson() => {
        "fuente": fuente,
        "finalidad": finalidad,
        "clasificador": clasificador,
        "monto_certificado": montoCertificado,
        "monto_liquidacion": montoLiquidacion,
        "monto_devengado": montoDevengado,
        "monto_devolucion": montoDevolucion,
        "saldo": saldo,
      };
}
