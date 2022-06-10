// To parse this JSON data, do
//
//     final resumenModel = resumenModelFromJson(jsonString);

import 'dart:convert';

List<ResumenModel> resumenModelFromJson(String str) => List<ResumenModel>.from(
    json.decode(str).map((x) => ResumenModel.fromJson(x)));

String resumenModelToJson(List<ResumenModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResumenModel {
  String? estado;
  int? cantidad;

  ResumenModel({
    this.estado,
    this.cantidad,
  });

  factory ResumenModel.fromJson(Map<String, dynamic> json) => ResumenModel(
        estado: json["estado"],
        cantidad: json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "cantidad": cantidad,
      };
}
