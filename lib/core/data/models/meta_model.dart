// To parse this JSON data, do
//
//     final metaEntity = metaEntityFromJson(jsonString);

import 'dart:convert';

import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

List<MetaModel> metaModelFromJson(String str) {
  List<dynamic> metaJson = json.decode(str);
  return List<MetaModel>.from((metaJson).map((x) => MetaModel.fromJson(x)));
}

String metaModelToJson(List<MetaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MetaModel extends MetaEntity {
  MetaModel(
      {idmetaAnual, anio, presupuesto, meta, finalidad, producto, actividad})
      : super(
          idmetaAnual: idmetaAnual,
          anio: anio,
          presupuesto: presupuesto,
          meta: meta,
          finalidad: finalidad,
          producto: producto,
          actividad: actividad,
        );

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        idmetaAnual: json["idmeta_anual"],
        anio: json["anio"],
        presupuesto: json["presupuesto"],
        meta: json["meta"],
        finalidad: json["finalidad"],
        producto: json["producto"],
        actividad: json["actividad"],
      );

  Map<String, dynamic> toJson() => {
        "idmeta_anual": idmetaAnual,
        "anio": anio,
        "meta": meta,
        "presupuesto": presupuesto,
        "finalidad": finalidad,
        "producto": producto,
        "actividad": actividad,
      };
}
