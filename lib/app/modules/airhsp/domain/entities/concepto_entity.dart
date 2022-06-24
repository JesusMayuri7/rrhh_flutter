// To parse this JSON data, do
//
//     final conceptoModel = conceptoModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ConceptoEntity conceptoModelFromJson(String str) =>
    ConceptoEntity.fromJson(json.decode(str));

String conceptoModelToJson(ConceptoEntity data) => json.encode(data.toJson());

class ConceptoEntity extends Equatable {
  String concepto;
  String descripcion;
  String monto;
  String fuente;

  ConceptoEntity({
    required this.concepto,
    required this.descripcion,
    required this.monto,
    required this.fuente,
  });

  factory ConceptoEntity.fromJson(Map<String, dynamic> json) =>
      new ConceptoEntity(
        concepto: json["concepto"],
        descripcion: json["descripcion"],
        monto: json["monto"],
        fuente: json["fuente"],
      );

  factory ConceptoEntity.fromMap(Map<String, dynamic> json) =>
      new ConceptoEntity(
        concepto: json["concepto"],
        descripcion: json["descripcion"],
        monto: json["monto"],
        fuente: json["fuente"],
      );

  Map<String, dynamic> toJson() => {
        "concepto": concepto,
        "descripcion": descripcion,
        "monto": monto,
        "fuente": fuente,
      };

  @override
  List<Object> get props => [concepto, descripcion, monto, fuente];
}
