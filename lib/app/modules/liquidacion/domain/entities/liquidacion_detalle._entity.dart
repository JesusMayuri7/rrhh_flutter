import 'dart:convert';

import 'package:equatable/equatable.dart';

class LiquidacionDetalleEntity extends Equatable {
  LiquidacionDetalleEntity({
    required this.clasificador,
    required this.montoCertificado,
    required this.montoLiquidacion,
    required this.montoDevengado,
    required this.montoDevolucion,
    required this.id,
  });

  final String clasificador;
  final double montoCertificado;
  final double montoLiquidacion;
  final double montoDevengado;
  final double montoDevolucion;
  final int id;

  @override
  String toString() {
    return 'LiquidacionDetalleEntity(clasificador: $clasificador,  montoCertificado: $montoCertificado,montoDevengado: $montoDevengado, montoDevolucion: $montoDevolucion, montoLiquidacion: $montoLiquidacion, liquidacionDetalleId: $id)';
  }

  Map<String, dynamic> toMap() {
    return {
      'clasificador': clasificador,
      'montoCertificado': montoCertificado,
      'montoLiquidacion': montoLiquidacion,
      'montoDevengado': montoDevengado,
      'montoDevolucion': montoDevolucion,
      'id': id,
    };
  }

  LiquidacionDetalleEntity copyWith({
    String? clasificador,
    double? montoCertificado,
    double? montoLiquidacion,
    double? montoDevengado,
    double? montoDevolucion,
    int? liquidacionDetalleId,
  }) {
    return LiquidacionDetalleEntity(
      clasificador: clasificador ?? this.clasificador,
      montoCertificado: montoCertificado ?? this.montoCertificado,
      montoLiquidacion: montoLiquidacion ?? this.montoLiquidacion,
      montoDevengado: montoDevengado ?? this.montoDevengado,
      montoDevolucion: montoDevolucion ?? this.montoDevolucion,
      id: liquidacionDetalleId ?? this.id,
    );
  }

  @override
  List<Object> get props {
    return [
      clasificador,
      montoDevengado,
      montoDevolucion,
      montoCertificado,
      montoLiquidacion,
      id,
    ];
  }

  factory LiquidacionDetalleEntity.fromMap(Map<String, dynamic> map) {
    return LiquidacionDetalleEntity(
      clasificador: map['clasificador'],
      montoCertificado: map['montoCertificado'],
      montoLiquidacion: map['montoLiquidacion'],
      montoDevengado: map['montoDevengado'],
      montoDevolucion: map['montoDevolucion'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LiquidacionDetalleEntity.fromJson(String source) =>
      LiquidacionDetalleEntity.fromMap(json.decode(source));
}
