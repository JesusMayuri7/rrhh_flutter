import 'dart:convert';

import 'liquidacion_detalle._model.dart';
import '../../domain/entities/liquidacion_entity.dart';

List<LiquidacionModel> liquidacionModelFromJson(String str) {
  List<dynamic> liquidacionJson = json.decode(str);

  return List<LiquidacionModel>.from(
      liquidacionJson.map((x) => LiquidacionModel.fromJson(x)));
}

class LiquidacionModel extends LiquidacionEntity {
  LiquidacionModel(
      {required int id,
      required String anio,
      required int modalidadId,
      required String dscModalidad,
      required int certificadoId,
      required int certificadoDevengadoId,
      required String dscCertificado,
      required String dscCertificadoDevengado,
      required String codigoPlaza,
      required String codigoSiga,
      required int fuenteId,
      required int fuenteDevengadoId,
      required int metaId,
      required int metaDevengadoId,
      required String finalidad,
      required String finalidadDevengado,
      required String dni,
      required String nombres,
      required String expediente,
      required String fechaExpediente,
      required String documento,
      required List<LiquidacionDetalleModel> liquidacionDetalle,
      required String actualizado,
      required String proceso})
      : super(
            id: id,
            anio: anio,
            modalidadId: modalidadId,
            dscModalidad: dscModalidad,
            certificadoId: certificadoId,
            certificadoDevengadoId: certificadoDevengadoId,
            dscCertificado: dscCertificado,
            dscCertificadoDevengado: dscCertificadoDevengado,
            codigoPlaza: codigoPlaza,
            codigoSiga: codigoSiga,
            fuenteId: fuenteId,
            fuenteDevengadoId: fuenteDevengadoId,
            metaId: metaId,
            metaDevengadoId: metaDevengadoId,
            finalidad: finalidad,
            finalidadDevengado: finalidadDevengado,
            dni: dni,
            nombres: nombres,
            expediente: expediente,
            fechaExpediente: fechaExpediente,
            documento: documento,
            liquidacionDetalle: liquidacionDetalle,
            actualizado: actualizado,
            proceso: proceso);

  factory LiquidacionModel.fromJson(Map<String, dynamic> json) => LiquidacionModel(
      id: json["id"],
      anio: json["anio"] ?? '0',
      modalidadId: json['modalidad_id'] ?? 0,
      dscModalidad: json['dsc_modalidad'] ?? '',
      certificadoId: json["certificado_id"] ?? 0,
      certificadoDevengadoId: json["certificado_devengado_id"] ?? 0,
      dscCertificado: json["dsc_certificado"] ?? '',
      dscCertificadoDevengado: json["dsc_certificado_devengado"] ?? '',
      codigoPlaza: json["codigo_plaza"] ?? '',
      codigoSiga: json["codigo_siga"] ?? '',
      fuenteId: json["fuente_id"] ?? 0,
      fuenteDevengadoId: json["fuente_devengado_id"] ?? 0,
      metaId: json["idmeta_anual"] ?? 0,
      metaDevengadoId: json["meta_devengado_id"] ?? 0,
      finalidad: json["finalidad"] ?? '',
      finalidadDevengado: json["finalidad_devengado"] ?? '',
      dni: json["dni"] ?? '',
      nombres: json["nombres"] ?? '',
      expediente: json['expediente'] ?? '',
      fechaExpediente: json['fecha_expediente'] ?? '',
      documento: json['documento'] ?? '',
      liquidacionDetalle:
          liquidacionDetalleModelFromJson(json['liquidacion_detalle']),
      actualizado: json['actualizado'] ?? '',
      proceso: json['proceso'] ?? ''

      /*     List<LiquidacionDetalleModel>.from(
                json["liquidacion_detalle"].map((x) {
          print('json ' + json["liquidacion_detalle"]);
          return LiquidacionDetalleModel.fromJson(x);*/
      );
}
