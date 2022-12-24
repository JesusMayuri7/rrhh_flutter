import 'dart:convert';

import 'package:intl/intl.dart';

import '../../domain/entities/confianza_entity.dart';

// Propuesta para Decodificar
/*
List<ConfianzaModel> confianzaModelFromJson(String str) =>
    List<ConfianzaModel>.from(
        json.decode(str).map((x) => ConfianzaModel.fromJson(x)));
*/

final formatDate = DateFormat('yyyy-MM-dd');

List<ConfianzaModel> confianzaModelFromJson(String str) {
  List<dynamic> confianzaJson = json.decode(str);
  return List<ConfianzaModel>.from(
      (confianzaJson).map((x) => ConfianzaModel.fromJson(x)));
}

class ConfianzaModel extends ConfianzaEntity {
  ConfianzaModel(
      {required id,
      required descArea,
      required cargo,
      required dni,
      required nombres,
      required inicio,
      required fin,
      required docDesignacion,
      required docCese,
      required direccion,
      required modalidad,
      required area_id,
      required trabajadorId,
      required detalle,
      required tipo,
      required plaza,
      required estado})
      : super(
            id: id,
            descArea: descArea,
            cargo: cargo,
            dni: dni,
            nombres: nombres,
            inicio: inicio,
            fin: fin,
            docDesignacion: docDesignacion,
            docCese: docCese,
            direccion: direccion,
            modalidad: modalidad,
            area_id: area_id,
            trabajadorId: trabajadorId,
            detalle: detalle,
            tipo: tipo,
            plaza: plaza,
            estado: estado);

  factory ConfianzaModel.fromJson(Map<String, dynamic> json) => ConfianzaModel(
      id: json["id"],
      descArea: json["desc_area"] ?? '',
      cargo: json["cargo"] ?? '',
      dni: json["dni"] ?? '',
      nombres: json["nombres"] ?? '',
      inicio: json['inicio'] ?? '',
      fin: json['fin'] ?? '0000-00-00',
      docDesignacion: json["doc_designacion"] ?? '',
      docCese: json["doc_cese"] ?? '',
      direccion: json["direccion"] ?? '',
      modalidad: json["modalidad"] ?? '',
      area_id: json["org_area_id"] ?? 0,
      trabajadorId: json["trabajador_id"] ?? 0,
      detalle: json["detalle"] ?? '',
      tipo: json["tipo"] ?? '',
      plaza: (json["plaza"] ?? 0).toString().padLeft(6, "0"),
      estado: json['estado'] ?? '');

  factory ConfianzaModel.fromMap(Map<String, dynamic> json) => ConfianzaModel(
      id: json["id"],
      plaza: json["plaza"],
      descArea: json["desc_area"],
      cargo: json["cargo"],
      dni: json["dni"],
      nombres: json["nombres"],
      inicio: json["inicio"],
      fin: json["fin"],
      docDesignacion: json["doc_designacion"],
      docCese: json["doc_cese"],
      direccion: json["direccion"],
      modalidad: json["modalidad"],
      area_id: json["area_id"],
      trabajadorId: json["trabajador_id"],
      detalle: json["detalle"],
      tipo: json["tipo"],
      estado: json['estado']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "plaza": plaza,
        "desc_area": descArea,
        "cargo": cargo,
        "dni": dni,
        "nombres": nombres,
        "inicio": inicio,
        "fin": fin,
        "doc_designacion": docDesignacion,
        "doc_cese": docCese,
        "direccion": direccion,
        "modalidad": modalidad,
        "area_id": area_id,
        "trabajador_id": trabajadorId,
        "detalle": detalle,
        "tipo": tipo,
        "estado": estado
      };

  Map<String, dynamic> toJson() => {
        "id": id,
        "plaza": plaza,
        "desc_area": descArea,
        "cargo": cargo,
        "dni": dni,
        "nombres": nombres,
        "inicio": inicio,
        "fin": fin,
        "doc_designacion": docDesignacion,
        "doc_cese": docCese,
        "direccion": direccion,
        "modalidad": modalidad,
        "org_area_id": area_id,
        "trabajador_id": trabajadorId,
        "detalle": detalle,
        "tipo": tipo,
        "estado": estado
      };
}
