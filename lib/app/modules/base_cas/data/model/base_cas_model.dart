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

String baseCasModelToJson(List<BaseCasModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseCasModel extends BaseCasEntity {
  BaseCasModel({
    required String codigoPlaza,
    required String presupuesto,
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
    required String estadoActual,
    required String estadoAir,
    required String sustentoLegal,
    required String nroConvocatoria,
    required String estadoConvocatoria,
    required String resultadoConvocatoria,
    required String fechaAlta,
    required String fechaBaja,
    required double monto,
    required String detalle,
  }) : super(
          codigoPlaza: codigoPlaza,
          presupuesto: presupuesto,
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
          estadoActual: estadoActual,
          estadoAir: estadoAir,
          sustentoLegal: sustentoLegal,
          nroConvocatoria: nroConvocatoria,
          estadoConvocatoria: estadoConvocatoria,
          resultadoConvocatoria: resultadoConvocatoria,
          fechaAlta: fechaAlta,
          fechaBaja: fechaBaja,
          monto: monto,
          detalle: detalle,
        );

  factory BaseCasModel.fromJson(Map<String, dynamic> json) {
    return BaseCasModel(
        codigoPlaza: json["codigo_plaza"] ?? "000000",
        presupuesto: json["presupuesto"] ?? '',
        producto: cast<String>(json["producto"] ?? '')
            .substring(9, cast<String>(json["producto"] ?? '').length),
        descArea: json["desc_area"] ?? '',
        sede: json["sede"] ?? '',
        fuenteBase: json["fuente_base"],
        meta: json["meta"] ?? '',
        meta2020: json["meta_2020"] ?? '',
        unidad: json["unidad"] ?? '',
        cargo: json["cargo"] ?? '',
        dni: json["dni"] ?? "00000000",
        nombres: json["nombres"] ?? '',
        monto: double.parse(json["monto"] ?? 0),
        modalidad: json["modalidad"] ?? '',
        vigencia: json["fecha_fin_vigencia_cas"] ?? '',
        estadoActual: json["estado_actual"] ?? '',
        estadoAir: json["estado_air"] ?? '',
        sustentoLegal: json["sustento_legal"] ?? '',
        nroConvocatoria: json["convocatoria_nro"] ?? '',
        estadoConvocatoria: json['estado_convocatoria'] ?? '',
        resultadoConvocatoria: json['estado_final'] ?? '',
        fechaAlta: json['fe_ingreso'] ?? '',
        fechaBaja: json['fe_salida'] ?? '',
        detalle: json['detalle'] ?? '');
  }
  Map<String, dynamic> toJson() => {
        "plaza": codigoPlaza,
        "presupuesto": presupuesto,
        "producto": producto,
        "sede": sede,
        "meta": meta,
        "meta_2020": meta2020,
        "cargo": cargo,
        "dni": dni,
        "nombres": nombres,
        "monto": monto,
        "modalidad": modalidad,
        "fecha_fin_vigencia_cas": vigencia,
        "estado_actual": estadoActual,
        "estado_air": estadoAir,
        "sustento_legal": sustentoLegal,
        "estadoConvocatoria": estadoConvocatoria,
        "resultadoConvocatoria": resultadoConvocatoria,
        "detalle": detalle
      };
}
