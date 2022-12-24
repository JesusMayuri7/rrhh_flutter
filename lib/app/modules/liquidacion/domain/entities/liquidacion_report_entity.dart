// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LiquidacionReportEntity extends Equatable {
  LiquidacionReportEntity(
      {required this.anio,
      required this.dscModalidad,
      required this.dscCertificado,
      required this.dscProducto,
      required this.certificadoDevengadoId,
      required this.fuenteId,
      required this.meta,
      required this.finalidad,
      required this.dscClasificador,
      required this.totalCertificado,
      required this.montoCertificado,
      required this.totalDevengado,
      required this.montoDevengado,
      required this.montoLiquidacion,
      required this.diffDevengado,
      required this.saldoDevengado,
      required this.estado,
      required this.abvFuente});

  final int anio;
  final String dscModalidad;
  final String dscCertificado;
  final String dscProducto;
  final int certificadoDevengadoId;
  final int fuenteId;
  final String meta;
  final String finalidad;
  final String dscClasificador;
  final double totalCertificado;
  final double montoCertificado;
  final double totalDevengado;
  final double montoDevengado;
  final double montoLiquidacion;
  final double diffDevengado;
  final double saldoDevengado;
  final String estado;
  final String abvFuente;

  @override
  String toString() {
    return 'LiquidacionReportEntity(anio: $anio, dscModalidad: $dscModalidad, dscCertificado: $dscCertificado, fuenteId: $fuenteId, finalidad: $finalidad, dscClasificador: $dscClasificador, totalCertificado: $totalCertificado, totalDevengado: $totalDevengado, montoDevengado: $montoDevengado, diffDevengado: $diffDevengado, saldoDevengado: $saldoDevengado, estado: $estado)';
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
      meta,
      finalidad,
      meta,
      dscClasificador,
      totalCertificado,
      montoCertificado,
      totalDevengado,
      montoDevengado,
      montoLiquidacion,
      diffDevengado,
      saldoDevengado,
      estado,
      abvFuente
    ];
  }

  LiquidacionReportEntity copyWith(
      {int? anio,
      String? dscModalidad,
      String? dscCertificado,
      String? dscProducto,
      int? certificadoDevengadoId,
      int? fuenteId,
      String? meta,
      String? finalidad,
      String? dscClasificador,
      double? totalCertificado,
      double? montoCertificado,
      double? totalDevengado,
      double? montoDevengado,
      double? montoLiquidacion,
      double? diffDevengado,
      double? saldoDevengado,
      String? estado,
      String? abvFuente}) {
    return LiquidacionReportEntity(
        anio: anio ?? this.anio,
        dscModalidad: dscModalidad ?? this.dscModalidad,
        dscCertificado: dscCertificado ?? this.dscCertificado,
        dscProducto: dscProducto ?? this.dscProducto,
        certificadoDevengadoId:
            certificadoDevengadoId ?? this.certificadoDevengadoId,
        fuenteId: fuenteId ?? this.fuenteId,
        meta: meta ?? this.meta,
        finalidad: finalidad ?? this.finalidad,
        dscClasificador: dscClasificador ?? this.dscClasificador,
        totalCertificado: totalCertificado ?? this.totalCertificado,
        montoCertificado: montoCertificado ?? this.montoCertificado,
        totalDevengado: totalDevengado ?? this.totalDevengado,
        montoDevengado: montoDevengado ?? this.montoDevengado,
        montoLiquidacion: montoLiquidacion ?? this.montoLiquidacion,
        diffDevengado: diffDevengado ?? this.diffDevengado,
        saldoDevengado: saldoDevengado ?? this.saldoDevengado,
        estado: estado ?? this.estado,
        abvFuente: abvFuente ?? this.abvFuente);
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'anio': anio,
      'dscModalidad': dscModalidad,
      'dscCertificado': dscCertificado,
      'dscProducto': dscProducto,
      'certificadoDevengadoId': certificadoDevengadoId,
      'abv_fuente': abvFuente,
      'meta': meta,
      'finalidad': finalidad,
      'dscClasificador': dscClasificador,
      'totalCertificado': totalCertificado,
      'montoCertificado': montoCertificado,
      'totalDevengado': totalDevengado,
      'montoDevengado': montoDevengado,
      'montoLiquidacion': montoLiquidacion,
      'diffDevengado': diffDevengado,
      'saldoDevengado': saldoDevengado,
      'estado': estado,
      'fuenteId': fuenteId,
    };
  }

  factory LiquidacionReportEntity.fromMap(Map<String, dynamic> map) {
    return LiquidacionReportEntity(
      anio: map['anio'] as int,
      dscModalidad: map['dscModalidad'] as String,
      dscCertificado: map['dscCertificado'] as String,
      dscProducto: map['dscProducto'] as String,
      certificadoDevengadoId: map['certificadoDevengadoId'] as int,
      fuenteId: map['fuenteId'] as int,
      finalidad: map['finalidad'] as String,
      meta: map['meta'] as String,
      dscClasificador: map['dscClasificador'] as String,
      totalCertificado: map['totalCertificado'] as double,
      montoCertificado: map['montoCertificado'] as double,
      totalDevengado: map['totalDevengado'] as double,
      montoDevengado: map['montoDevengado'] as double,
      montoLiquidacion: map['montoLiquidacion'] as double,
      diffDevengado: map['diffDevengado'] as double,
      saldoDevengado: map['saldoDevengado'] as double,
      estado: map['estado'] as String,
      abvFuente: map['abv_fuente'] as String,
    );
  }

  factory LiquidacionReportEntity.fromJson(String source) =>
      LiquidacionReportEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
