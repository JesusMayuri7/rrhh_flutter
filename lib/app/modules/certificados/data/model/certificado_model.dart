// To parse this JSON data, do
//
//     final certificadoModel = certificadoModelFromJson(jsonString);

import 'dart:convert';

import 'package:rrhh_clean/app/modules/certificados/domain/entities/certificado_entity.dart';

List<CertificadoModel> certificadoListModelFromJson(String str) {
  List<dynamic> certificadoJson = json.decode(str);
  return List<CertificadoModel>.from(
      (certificadoJson).map((x) => CertificadoModel.fromJson(x)));
}

CertificadoModel certificadoModelFromJson(String str) {
  dynamic certificadoJson = json.decode(str)['data'];
  return CertificadoModel.fromJson((certificadoJson));
}

String certificadoModelToJson(List<CertificadoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CertificadoModel extends CertificadoEntity {
  CertificadoModel({
    required anoEje,
    required certificadoId,
    required clasificadorId,
    required dscCertificado,
    required fuente,
    required fuenteBase,
    required clasificador,
    required modalidad,
    required tipo,
    required detalle,
    required concepto,
    required secFunc,
    required finalidad,
    required idmetaAnual,
    required monto,
    required saldo,
    required devengado,
    required enero,
    required febrero,
    required marzo,
    required abril,
    required mayo,
    required junio,
    required julio,
    required agosto,
    required setiembre,
    required octubre,
    required noviembre,
    required diciembre,
  }) : super(
          anoEje: anoEje,
          certificadoId: certificadoId,
          clasificadorId: clasificadorId,
          dscCertificado: dscCertificado,
          fuente: fuente,
          fuenteBase: fuenteBase,
          clasificador: clasificador,
          modalidad: modalidad,
          tipo: tipo,
          detalle: detalle,
          concepto: concepto,
          secFunc: secFunc,
          finalidad: finalidad,
          idmetaAnual: idmetaAnual,
          monto: monto,
          devengado: devengado,
          saldo: saldo,
          enero: enero,
          febrero: febrero,
          marzo: marzo,
          abril: abril,
          mayo: mayo,
          junio: junio,
          julio: julio,
          agosto: agosto,
          setiembre: setiembre,
          octubre: octubre,
          noviembre: noviembre,
          diciembre: diciembre,
        );

  factory CertificadoModel.fromJson(Map<String, dynamic> json) =>
      CertificadoModel(
        anoEje: json["ano_eje"] ?? 0,
        certificadoId: json["certificado_id"] ?? 0,
        clasificadorId: json["clasificador_id"] ?? 0,
        dscCertificado: json["dsc_certificado"],
        fuente: json["fuente"] ?? 0,
        fuenteBase: json["fuente_base"] ?? '',
        clasificador: json["clasificador"] ?? '',
        modalidad: json["modalidad"],
        tipo: json["tipo"] ?? '',
        detalle: json["detalle"] ?? '',
        concepto: json["concepto"] ?? '',
        secFunc: json["sec_func"] ?? '',
        finalidad: json["finalidad"] ?? '',
        idmetaAnual: json["idmeta_anual"] ?? 0,
        monto: json["monto"] ?? 0,
        saldo: json["saldo"] ?? 0,
        devengado: json["devengado"] ?? 0,
        enero: json["enero"] ?? 0,
        febrero: json["febrero"] ?? 0,
        marzo: json["marzo"] ?? 0,
        abril: json["abril"] ?? 0,
        mayo: json["mayo"] ?? 0,
        junio: json["junio"] ?? 0,
        julio: json["julio"] ?? 0,
        agosto: json["agosto"] ?? 0,
        setiembre: json["setiembre"] ?? 0,
        octubre: json["octubre"] ?? 0,
        noviembre: json["noviembre"] ?? 0,
        diciembre: json["diciembre"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "ano_eje": anoEje,
        "certificado_id": certificadoId,
        "clasificador_id": clasificadorId,
        "dsc_certificado": dscCertificado,
        "fuente": fuente,
        "fuente_base": fuenteBase,
        "clasificador": clasificador,
        "modalidad": modalidad,
        "tipo": tipo,
        "detalle": detalle,
        "concepto": concepto,
        "sec_func": secFunc,
        "finalidad": finalidad,
        "idmeta_anual": idmetaAnual,
        "monto": monto,
        "devengado": devengado,
        "saldo": saldo,
        "enero": enero,
        "febrero": febrero,
        "marzo": marzo,
        "abril": abril,
        "mayo": mayo,
        "junio": junio,
        "julio": julio,
        "agosto": agosto,
        "setiembre": setiembre,
        "octubre": octubre,
        "noviembre": noviembre,
        "diciembre": diciembre,
      };
}
