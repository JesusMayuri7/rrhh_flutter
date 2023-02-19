// To parse String? JSON data, do
//
//     final resolucionModel = resolucionModelFromJson(jsonString);

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/base_cas_entity.dart';

List<BaseCasModel> baseCasModelFromJson(String str) {
  List<dynamic> baseCasJson = json.decode(str);
  return List<BaseCasModel>.from(
      (baseCasJson).map((x) => BaseCasModel.fromJson(x)));
}

List<BaseCasModel> baseCasModelFromJson2023(String str) {
  List<dynamic> baseCasJson = json.decode(str);
  return List<BaseCasModel>.from(
      (baseCasJson).map((x) => BaseCasModel.fromJson2023(x)));
}

String baseCasModelToJson(List<BaseCasModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseCasModel extends BaseCasEntity {
  BaseCasModel({
    required String codigoPlaza,
    required String anio,
    required String presupuesto,
    required String certificado,
    required String producto,
    required String descArea,
    required String sede,
    required String fuenteBase,
    required String meta,
    required String meta2020,
    required String unidad,
    required String cargo,
    required String dni,
    required String nombres,
    required String modalidad,
    required String vigencia,
    required String estadoOpp,
    required String estadoActual,
    required String estadoAir,
    required String sustentoLegal,
    required String nroConvocatoria,
    required String estadoConvocatoria,
    required String fase,
    required String tipoIngreso,
    required String fechaAlta,
    required String tipoSalida,
    required String fechaBaja,
    required String finLicencia,
    required double monto,
    required String detalle,
    required int mesInicio,
    required int mesFin,
  }) : super(
            codigoPlaza: codigoPlaza,
            anio: anio,
            presupuesto: presupuesto,
            certificado: certificado,
            producto: producto,
            descArea: descArea,
            sede: sede,
            fuenteBase: fuenteBase,
            meta: meta,
            meta2020: meta2020,
            cargo: cargo,
            dni: dni,
            nombres: nombres,
            modalidad: modalidad,
            vigencia: vigencia,
            estadoOpp: estadoOpp,
            estadoActual: estadoActual,
            estadoAir: estadoAir,
            sustentoLegal: sustentoLegal,
            nroConvocatoria: nroConvocatoria,
            estadoConvocatoria: estadoConvocatoria,
            fase: fase,
            tipoIngreso: tipoIngreso,
            fechaAlta: fechaAlta,
            tipoSalida: tipoSalida,
            fechaBaja: fechaBaja,
            finLicencia: finLicencia,
            monto: monto,
            detalle: detalle,
            mesInicio: mesInicio,
            mesFin: mesFin);

  factory BaseCasModel.fromJson(Map<String, dynamic> json) {
    return BaseCasModel(
        codigoPlaza: json["codigo_plaza"] ?? "000000",
        anio: json["anio"].toString(),
        presupuesto: json["presupuesto"] ?? '',
        certificado: json["certificado"] ?? 'NO',
        producto: cast<String>(json["producto"] ?? '')
            .substring(9, cast<String>(json["producto"] ?? '').length),
        descArea: json["desc_area_cert"] ?? '',
        sede: json["sede"] ?? '',
        fuenteBase: json["fuente_base"] ?? '',
        meta: json["meta"] ?? '',
        meta2020: json["meta_2020"] ?? '',
        unidad: json["unidad"] ?? '',
        cargo: json["cargo_cert"] ?? '',
        dni: json["dni"] ?? "00000000",
        nombres: json["nombres"] ?? '',
        monto: double.parse(json["monto_cert"] ?? 0),
        modalidad: json["modalidad"] ?? '',
        vigencia: json["fecha_fin_vigencia_cas"] ?? '',
        estadoOpp: json["estado_opp"] ?? '',
        estadoActual: json["estado_actual"] ?? '',
        estadoAir: json["estado_air"] ?? '',
        sustentoLegal: json["sustento_legal"] ?? '',
        nroConvocatoria: json["convocatoria_nro"] ?? '',
        estadoConvocatoria: json['estado_convocatoria'] ?? '',
        fase: json['fase'] ?? '',
        tipoIngreso: json['tipo_ingreso'] ?? '',
        fechaAlta: json['fe_ingreso'] ?? '',
        tipoSalida: json['tipo_salida'] ?? '',
        fechaBaja: json['fe_salida'] ?? '',
        finLicencia: json['fin_licencia'] ?? '',
        detalle: json['detalle'] ?? '',
        mesInicio: json['mes_inicio'] ?? 0,
        mesFin: json['mes_fin'] ?? 0);
  }

  factory BaseCasModel.fromJson2023(Map<String, dynamic> json) {
    return BaseCasModel(
        codigoPlaza: json["codigo_plaza"] ?? "000000",
        anio: json["anio"] ?? "anio",
        presupuesto: json["presupuesto"] ?? '',
        certificado: json["certificado"] ?? 'NO',
        producto: cast<String>(json["producto"] ?? '')
            .substring(9, cast<String>(json["producto"] ?? '').length),
        descArea: json["desc_area_cert"] ?? '',
        sede: json["sede"] ?? '',
        fuenteBase: 'RO',
        meta: json["meta"] ?? '',
        meta2020: json["meta_2020"] ?? '',
        unidad: json["unidad"] ?? '',
        cargo: json["cargo_cert"] ?? '',
        dni: json["dni"] ?? "",
        nombres: json["nombres"] ?? '',
        monto: double.parse(json["monto_cert"] ?? 0),
        modalidad: json["modalidad"] ?? '',
        vigencia: json["fecha_fin_vigencia_cas"] ?? '',
        estadoOpp: json["estado_opp"] ?? '',
        estadoActual: json["estado_actual"] ?? '',
        estadoAir: json["estado_air"] ?? '',
        sustentoLegal: json["sustento_legal"] ?? '',
        nroConvocatoria: json["convocatoria_nro"] ?? '',
        estadoConvocatoria: json['estado_convocatoria'] ?? '',
        fase: json['fase'] ?? '',
        tipoIngreso: json['tipo_ingreso'] ?? '',
        fechaAlta: json['fe_ingreso'] ?? '',
        tipoSalida: json['tipo_salida'] ?? '',
        fechaBaja: json['fe_salida'] ?? '',
        finLicencia: json['fin_licencia'] ?? '',
        detalle: json['detalle'] ?? '',
        mesInicio: json['mes_inicio'] ?? 0,
        mesFin: json['mes_fin'] ?? 0);
  }

  Map<String, dynamic> toJson() => {
        "plaza": codigoPlaza,
        "anio": anio,
        "presupuesto": presupuesto,
        "certificado": certificado,
        "sede": sede,
        "meta": meta,
        "meta_2020": meta2020,
        "cargo": cargo,
        "dni": dni,
        "nombres": nombres,
        "monto": monto,
        "modalidad": modalidad,
        "fecha_fin_vigencia_cas": vigencia,
        "fin_licencia": finLicencia,
        "estado_actual": estadoActual,
        "estado_opp": estadoOpp,
        "estado_air": estadoAir,
        "sustento_legal": sustentoLegal,
        "estadoConvocatoria": estadoConvocatoria,
        "fase": fase,
        "detalle": detalle
      };
}
