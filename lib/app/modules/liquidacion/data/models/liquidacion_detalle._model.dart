import 'dart:convert';

import '../../domain/entities/liquidacion_detalle._entity.dart';

List<LiquidacionDetalleModel> liquidacionDetalleModelFromJson(String str) =>
    List<LiquidacionDetalleModel>.from(
        json.decode(str).map((x) => LiquidacionDetalleModel.fromJson(x)));

String liquidacionDetalleModelToJson(List<LiquidacionDetalleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LiquidacionDetalleModel extends LiquidacionDetalleEntity {
  LiquidacionDetalleModel({
    required String clasificador,
    required double montoDevengado,
    required double montoDevolucion,
    required double montoCertificado,
    required double montoLiquidacion,
    required int id,
  }) : super(
          clasificador: clasificador,
          montoDevengado: montoDevengado,
          montoDevolucion: montoDevolucion,
          montoCertificado: montoCertificado,
          montoLiquidacion: montoLiquidacion,
          id: id,
        );

  factory LiquidacionDetalleModel.fromJson(Map<String, dynamic> json) {
    return LiquidacionDetalleModel(
      clasificador: json["clasificador"] ?? '',
      montoDevengado: (json["monto_devengado"] ?? 0).toDouble(),
      montoDevolucion: (json["monto_devolucion"] ?? 0).toDouble(),
      montoCertificado: (json["monto_certificado"] ?? 0).toDouble(),
      montoLiquidacion: (json["monto_liquidacion"] ?? 0).toDouble(),
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'clasificador': clasificador,
      'montoDevengado': montoDevengado,
      'montoDevolucion': montoDevolucion,
      'montoCertificado': montoCertificado,
      'montoLiquidacion': montoLiquidacion,
      'id': id,
    };
  }
}
