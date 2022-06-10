// To parse this JSON data, do
//
import 'dart:convert';

import 'package:rrhh_clean/app/modules/home/domain/cap_estado_opp_entity.dart';

List<CapEstadoOppModel> capEstadoOppModelFromJson(String str) =>
    List<CapEstadoOppModel>.from(
        json.decode(str).map((x) => CapEstadoOppModel.fromJson(x)));

String capEstadoOppModelToJson(List<CapEstadoOppModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CapEstadoOppModel extends CapEstadoOppEntity {
  CapEstadoOppModel({
    required int orgUId,
    required String modalidad,
    required String descUnidad,
    required int ocupado,
    required int vacante,
    required int reservado,
  }) : super(
            orgUId: orgUId,
            modalidad: modalidad,
            descUnidad: descUnidad,
            ocupado: ocupado,
            vacante: vacante,
            reservado: reservado);

  factory CapEstadoOppModel.fromJson(Map<String, dynamic> json) =>
      CapEstadoOppModel(
        orgUId: json["org_u_id"],
        modalidad: json["modalidad"],
        descUnidad: json["desc_unidad"],
        ocupado: json["ocupado"],
        vacante: json["vacante"],
        reservado: json["reservado"],
      );

  Map<String, dynamic> toJson() => {
        "org_u_id": orgUId,
        "modalidad": modalidad,
        "desc_unidad": descUnidad,
        "ocupado": ocupado,
        "vacante": vacante,
        "reservado": reservado,
      };
}
