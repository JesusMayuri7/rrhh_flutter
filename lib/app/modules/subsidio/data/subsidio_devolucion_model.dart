import 'dart:convert';

import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';

List<SubsidioDevolucionModel> subsidioDevolucionModelFromJson(String str) =>
    List<SubsidioDevolucionModel>.from(
        json.decode(str).map((x) => SubsidioDevolucionModel.fromJson(x)));

String subsidioDevolucionModelToJson(List<SubsidioDevolucionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubsidioDevolucionModel extends SubsidioDevolucionEntity {
  SubsidioDevolucionModel({
    required int id,
    required int anio,
    required int modalidadId,
    required String dscModalidad,
    required int certificadoId,
    required String dscCertificado,
    required String codigoPlaza,
    required String codigoSiga,
    required String dscFuente,
    required int fuenteId,
    required int metaId,
    required String dscMeta,
    required String dni,
    required String nombres,
    required String expediente,
    required int clasificadorId,
    required String dscClasificador,
    required String tipo,
    required String estado,
    required int mesProceso,
    required String fechaDevengado,
    required double montoDevolucion,
  }) : super(
            id: id,
            anio: anio,
            modalidadId: modalidadId,
            dscModalidad: dscModalidad,
            certificadoId: certificadoId,
            dscCertificado: dscCertificado,
            codigoPlaza: codigoPlaza,
            codigoSiga: codigoSiga,
            dscFuente: dscFuente,
            fuenteId: fuenteId,
            metaId: metaId,
            dscMeta: dscMeta,
            dni: dni,
            nombres: nombres,
            expediente: expediente,
            clasificadorId: clasificadorId,
            dscClasificador: dscClasificador,
            tipo: tipo,
            estado: estado,
            mesProceso: mesProceso,
            fechaDevengado: fechaDevengado,
            montoDevolucion: montoDevolucion);

  factory SubsidioDevolucionModel.fromJson(Map<String, dynamic> json) =>
      SubsidioDevolucionModel(
        id: json["id"],
        anio: json["anio"],
        modalidadId: json["modalidad_id"] ?? 0,
        dscModalidad: json["dsc_modalidad"] ?? '',
        certificadoId: json["certificado_id"] ?? 0,
        dscCertificado: json["dsc_certificado"] ?? '',
        codigoPlaza: json["codigo_plaza"] ?? '',
        codigoSiga: json["codigo_siga"] ?? '',
        dscFuente: json["dsc_fuente"] ?? '',
        fuenteId: json["fuente_id"] ?? 0,
        metaId: json["meta_id"] ?? 0,
        dscMeta: json["dsc_meta"] ?? '',
        dni: json["dni"] ?? '',
        nombres: json["nombres"] ?? '',
        expediente: json["expediente"] ?? '',
        clasificadorId: json["clasificador_id"] ?? 0,
        dscClasificador: json["dsc_clasificador"] ?? '',
        tipo: json["tipo"] ?? '',
        estado: json["estado"] ?? '',
        mesProceso: json["mes_proceso"] ?? 0,
        fechaDevengado: json["fecha_devolucion"] ?? '',
        montoDevolucion: (json["monto_devolucion"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "anio": anio,
        "modalidad_id": modalidadId,
        "dsc_modalidad": dscModalidad,
        "certificado_id": certificadoId,
        "dsc_certificado": dscCertificado,
        "codigo_plaza": codigoPlaza,
        "codigo_siga": codigoSiga,
        "dsc_fuente": dscFuente,
        "fuente_id": fuenteId,
        "meta_id": metaId,
        "dsc_meta": dscMeta,
        "dni": dni,
        "nombres": nombres,
        "expediente": expediente,
        "clasificador_id": clasificadorId,
        "dsc_clasificador": dscClasificador,
        "estado": estado,
        "mes_proceso": mesProceso,
        "fecha_devengado": fechaDevengado,
        "monto_devolucion": montoDevolucion,
      };
}
