// To parse this JSON data, do
//
//     final certificadoModel = certificadoModelFromJson(jsonString);

import 'dart:convert';

import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';

List<CertificadoModel> certificadoModelFromJson(String str) =>
    List<CertificadoModel>.from(
        json.decode(str).map((x) => CertificadoModel.fromJson(x)));

String certificadoModelToJson(List<CertificadoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CertificadoModel extends CertificadoEntity {
  CertificadoModel({
    required id,
    required anio,
    required dscCertificado,
    required activo,
    required detalle,
    required monto,
    required solicitante,
    required docSolicitado,
    required docCertificacion,
  }) : super(
            id: id,
            anio: anio,
            dscCertificado: dscCertificado,
            activo: activo,
            detalle: detalle,
            monto: monto,
            solicitante: solicitante,
            docSolicitado: docSolicitado,
            docCertificacion: docCertificacion);

  factory CertificadoModel.fromJson(Map<String, dynamic> json) =>
      CertificadoModel(
        id: json["id"],
        anio: json["anio"] ?? 0,
        dscCertificado: json["dsc_certificado"] ?? '',
        activo: json["activo"] ?? 0,
        detalle: json["detalle"] ?? '',
        monto: json["monto"] ?? 0,
        solicitante: json["solicitante"] ?? '',
        docSolicitado: json["doc_solicitado"] ?? '',
        docCertificacion: json["doc_certificacion"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dsc_certificado": dscCertificado,
        "activo": activo,
        "detalle": detalle,
        "monto": monto,
        "anio": anio,
        "solicitante": solicitante,
        "doc_solicitado": docSolicitado,
        "doc_certificacion": docCertificacion,
      };
}
