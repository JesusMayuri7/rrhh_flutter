import 'dart:convert';

import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_report_entity.dart';

List<LiquidacionReportModel> liquidacionReportEntityFromJson(String str) =>
    List<LiquidacionReportModel>.from(
        json.decode(str).map((x) => LiquidacionReportModel.fromJson(x)));

String liquidacionReportEntityToJson(List<LiquidacionReportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LiquidacionReportModel extends LiquidacionReportEntity {
  LiquidacionReportModel({
    required int anio,
    required String dscModalidad,
    required String dscCertificado,
    required String dscProducto,
    required int certificadoDevengadoId,
    required int fuenteId,
    required String finalidad,
    required String dscClasificador,
    required double totalCertificado,
    required double montoCertificado,
    required double totalDevengado,
    required double montoDevengado,
    required double montoLiquidacion,
    required double diffDevengado,
    required double saldoDevengado,
  }) : super(
          anio: anio,
          dscModalidad: dscModalidad,
          dscCertificado: dscCertificado,
          dscProducto: dscProducto,
          certificadoDevengadoId: certificadoDevengadoId,
          fuenteId: fuenteId,
          finalidad: finalidad,
          dscClasificador: dscClasificador,
          totalCertificado: totalCertificado,
          montoCertificado: montoCertificado,
          totalDevengado: totalDevengado,
          montoDevengado: montoDevengado,
          montoLiquidacion: montoLiquidacion,
          diffDevengado: diffDevengado,
          saldoDevengado: saldoDevengado,
        );

  factory LiquidacionReportModel.fromJson(Map<String, dynamic> json) =>
      LiquidacionReportModel(
        anio: json["anio"],
        dscModalidad: json["dsc_modalidad"] ?? '',
        dscCertificado: json["dsc_certificado"] ?? '',
        dscProducto: json["dsc_producto"] ?? '',
        certificadoDevengadoId: json["certificado_id"] ?? 0,
        fuenteId: json["fuente_id"] ?? 0,
        finalidad: json["dsc_finalidad"] ?? '',
        dscClasificador: json["dsc_clasificador"] ?? '',
        totalCertificado: json["total_certificado"].toDouble(),
        montoCertificado: json["monto_certificado"].toDouble(),
        totalDevengado: json["total_devengado"].toDouble(),
        montoDevengado: json["monto_devengado"].toDouble(),
        montoLiquidacion: json["monto_liquidacion"].toDouble(),
        diffDevengado: json["diff_devengado"].toDouble(),
        saldoDevengado: json["saldo_devengado"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "dsc_modalidad": dscModalidad,
        "dsc_certificado": dscCertificado,
        "dsc_producto": dscProducto,
        "certificado_id": certificadoDevengadoId,
        "fuente_id": fuenteId,
        "dsc_finalidad": finalidad,
        "dsc_clasificador": dscClasificador,
        "total_certificado": totalCertificado,
        "monto_certificado": montoCertificado,
        "total_devengado": totalDevengado,
        "monto_devengado": montoDevengado,
        "monto_liquidacion": montoLiquidacion,
        "diff_devengado": diffDevengado,
        "saldo_devengado": saldoDevengado,
      };
}
