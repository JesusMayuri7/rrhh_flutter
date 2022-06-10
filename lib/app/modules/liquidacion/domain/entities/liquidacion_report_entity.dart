import 'dart:convert';

import 'package:equatable/equatable.dart';

class LiquidacionReportEntity extends Equatable {
  LiquidacionReportEntity({
    required this.anio,
    required this.dscModalidad,
    required this.dscCertificado,
    required this.dscProducto,
    required this.fuenteId,
    required this.certificadoDevengadoId,
    required this.finalidad,
    required this.dscClasificador,
    required this.totalCertificado,
    required this.montoCertificado,
    required this.totalDevengado,
    required this.montoDevengado,
    required this.montoLiquidacion,
    required this.diffDevengado,
    required this.saldoDevengado,
  });

  final int anio;
  final String dscModalidad;
  final String dscCertificado;
  final String dscProducto;
  final int certificadoDevengadoId;
  final int fuenteId;
  final String finalidad;
  final String dscClasificador;
  final double totalCertificado;
  final double montoCertificado;
  final double totalDevengado;
  final double montoDevengado;
  final double montoLiquidacion;

  final double diffDevengado;
  final double saldoDevengado;

  @override
  String toString() {
    return 'LiquidacionReportEntity(anio: $anio, dscModalidad: $dscModalidad, dscCertificado: $dscCertificado, fuenteId: $fuenteId, finalidad: $finalidad, dscClasificador: $dscClasificador, totalCertificado: $totalCertificado, totalDevengado: $totalDevengado, montoDevengado: $montoDevengado, diffDevengado: $diffDevengado, saldoDevengado: $saldoDevengado)';
  }

  @override
  List<Object> get props {
    return [
      anio,
      dscModalidad,
      dscCertificado,
      dscProducto,
      certificadoDevengadoId,
      fuenteId,
      finalidad,
      dscClasificador,
      totalCertificado,
      montoCertificado,
      totalDevengado,
      montoDevengado,
      montoLiquidacion,
      diffDevengado,
      saldoDevengado,
    ];
  }

  LiquidacionReportEntity copyWith({
    int? anio,
    String? dscModalidad,
    String? dscCertificado,
    String? dscProducto,
    int? certificadoDevengadoId,
    int? fuenteId,
    String? finalidad,
    String? dscClasificador,
    double? totalCertificado,
    double? montoCertificado,
    double? totalDevengado,
    double? montoDevengado,
    double? montoLiquidacion,
    double? diffDevengado,
    double? saldoDevengado,
  }) {
    return LiquidacionReportEntity(
      anio: anio ?? this.anio,
      dscModalidad: dscModalidad ?? this.dscModalidad,
      dscCertificado: dscCertificado ?? this.dscCertificado,
      dscProducto: dscProducto ?? this.dscProducto,
      certificadoDevengadoId:
          certificadoDevengadoId ?? this.certificadoDevengadoId,
      fuenteId: fuenteId ?? this.fuenteId,
      finalidad: finalidad ?? this.finalidad,
      dscClasificador: dscClasificador ?? this.dscClasificador,
      totalCertificado: totalCertificado ?? this.totalCertificado,
      montoCertificado: montoCertificado ?? this.montoCertificado,
      totalDevengado: totalDevengado ?? this.totalDevengado,
      montoDevengado: montoDevengado ?? this.montoDevengado,
      montoLiquidacion: montoLiquidacion ?? this.montoLiquidacion,
      diffDevengado: diffDevengado ?? this.diffDevengado,
      saldoDevengado: saldoDevengado ?? this.saldoDevengado,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'anio': anio,
      'dscModalidad': dscModalidad,
      'dscCertificado': dscCertificado,
      'dscProducto': dscProducto,
      'certificadoDevengadoId': certificadoDevengadoId,
      'fuenteId': fuenteId,
      'finalidad': finalidad,
      'dscClasificador': dscClasificador,
      'totalCertificado': totalCertificado,
      'montoCertificado': montoCertificado,
      'totalDevengado': totalDevengado,
      'montoDevengado': montoDevengado,
      'montoLiquidacion': montoLiquidacion,
      'diffDevengado': diffDevengado,
      'saldoDevengado': saldoDevengado,
    };
  }

  factory LiquidacionReportEntity.fromMap(Map<String, dynamic> map) {
    return LiquidacionReportEntity(
      anio: map['anio'],
      dscModalidad: map['dscModalidad'],
      dscCertificado: map['dscCertificado'],
      dscProducto: map['dscProducto'],
      certificadoDevengadoId: map['certificadoDevengadoId'],
      fuenteId: map['fuenteId'],
      finalidad: map['finalidad'],
      dscClasificador: map['dscClasificador'],
      totalCertificado: map['totalCertificado'],
      montoCertificado: map['montoCertificado'],
      totalDevengado: map['totalDevengado'],
      montoDevengado: map['montoDevengado'],
      montoLiquidacion: map['montoLiquidacion'],
      diffDevengado: map['diffDevengado'],
      saldoDevengado: map['saldoDevengado'],
    );
  }

  factory LiquidacionReportEntity.fromJson(String source) =>
      LiquidacionReportEntity.fromMap(json.decode(source));
}
