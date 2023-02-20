import 'package:equatable/equatable.dart';

import 'liquidacion_detalle._entity.dart';

class LiquidacionEntity extends Equatable {
  LiquidacionEntity({
    required this.id,
    required this.anio,
    required this.modalidadId,
    required this.dscModalidad,
    required this.certificadoId,
    required this.certificadoDevengadoId,
    required this.dscCertificado,
    required this.dscCertificadoDevengado,
    required this.codigoPlaza,
    required this.codigoSiga,
    required this.fuenteId,
    required this.fuenteDevengadoId,
    required this.metaId,
    required this.metaDevengadoId,
    required this.finalidad,
    required this.finalidadDevengado,
    required this.dni,
    required this.nombres,
    required this.expediente,
    required this.fechaExpediente,
    required this.documento,
    required this.liquidacionDetalle,
    required this.actualizado,
    required this.proceso,
  });

  final int id;
  final String anio;
  final int modalidadId;
  final String dscModalidad;
  final int certificadoId;
  final int certificadoDevengadoId;
  final String dscCertificado;
  final String dscCertificadoDevengado;
  final String codigoPlaza;
  final String codigoSiga;
  final int fuenteId;
  final int fuenteDevengadoId;
  final int metaId;
  final int metaDevengadoId;
  final String finalidad;
  final String finalidadDevengado;
  final String dni;
  final String nombres;
  final String expediente;
  final String fechaExpediente;
  final String documento;
  final List<LiquidacionDetalleEntity> liquidacionDetalle;
  final String actualizado;
  final String proceso;

/*       factory LiquidacionReportEntity.fromJson(Map<String, dynamic> json) =>
      LiquidacionReportEntity(
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
      ); */

  @override
  List<Object> get props {
    return [
      id,
      anio,
      modalidadId,
      dscModalidad,
      certificadoId,
      certificadoDevengadoId,
      dscCertificado,
      dscCertificadoDevengado,
      codigoPlaza,
      codigoSiga,
      fuenteId,
      fuenteDevengadoId,
      metaId,
      metaDevengadoId,
      finalidad,
      finalidadDevengado,
      dni,
      nombres,
      expediente,
      fechaExpediente,
      documento,
      liquidacionDetalle,
      actualizado,
      proceso,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'anio': anio,
      'modalidadId': modalidadId,
      'dscModalidad': dscModalidad,
      'certificadoId': certificadoId,
      'certificadoDevengadoId': certificadoDevengadoId,
      'dscCertificado': dscCertificado,
      'dscCertificadoDevengado': dscCertificadoDevengado,
      'codigoPlaza': codigoPlaza,
      'codigoSiga': codigoSiga,
      'fuenteId': fuenteId,
      'fuenteDevengadoId': fuenteDevengadoId,
      'metaId': metaId,
      'metaDevengadoId': metaDevengadoId,
      'finalidad': finalidad,
      'finalidadDevengado': finalidadDevengado,
      'dni': dni,
      'nombres': nombres,
      'expediente': expediente,
      'fechaExpediente': fechaExpediente,
      'documento': documento,
      'liquidacionDetalle': liquidacionDetalle.map((x) => x.toMap()).toList(),
      'updatet_at': actualizado,
      'proceso': proceso,
    };
  }

  LiquidacionEntity copyWith({
    int? id,
    String? anio,
    int? modalidadId,
    String? dscModalidad,
    int? certificadoId,
    int? certificadoDevengadoId,
    String? dscCertificado,
    String? dscCertificadoDevengado,
    String? codigoPlaza,
    String? codigoSiga,
    int? fuenteId,
    int? fuenteDevengadoId,
    int? metaId,
    int? metaDevengadoId,
    String? finalidad,
    String? finalidadDevengado,
    String? dni,
    String? nombres,
    String? expediente,
    String? fechaExpediente,
    String? documento,
    List<LiquidacionDetalleEntity>? liquidacionDetalle,
    String? actualizado,
    String? proceso,
  }) {
    return LiquidacionEntity(
      id: id ?? this.id,
      anio: anio ?? this.anio,
      modalidadId: modalidadId ?? this.modalidadId,
      dscModalidad: dscModalidad ?? this.dscModalidad,
      certificadoId: certificadoId ?? this.certificadoId,
      certificadoDevengadoId:
          certificadoDevengadoId ?? this.certificadoDevengadoId,
      dscCertificado: dscCertificado ?? this.dscCertificado,
      dscCertificadoDevengado:
          dscCertificadoDevengado ?? this.dscCertificadoDevengado,
      codigoPlaza: codigoPlaza ?? this.codigoPlaza,
      codigoSiga: codigoSiga ?? this.codigoSiga,
      fuenteId: fuenteId ?? this.fuenteId,
      fuenteDevengadoId: fuenteDevengadoId ?? this.fuenteDevengadoId,
      metaId: metaId ?? this.metaId,
      metaDevengadoId: metaDevengadoId ?? this.metaDevengadoId,
      finalidad: finalidad ?? this.finalidad,
      finalidadDevengado: finalidadDevengado ?? this.finalidadDevengado,
      dni: dni ?? this.dni,
      nombres: nombres ?? this.nombres,
      expediente: expediente ?? this.expediente,
      fechaExpediente: fechaExpediente ?? this.fechaExpediente,
      documento: documento ?? this.documento,
      liquidacionDetalle: liquidacionDetalle ?? this.liquidacionDetalle,
      actualizado: actualizado ?? this.actualizado,
      proceso: proceso ?? this.proceso,
    );
  }
}
