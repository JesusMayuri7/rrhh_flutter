// To parse this JSON data, do
//
//     final conceptoModel = conceptoModelFromJson(jsonString);

import 'dart:convert';
import 'package:xml/xml.dart';

import 'package:rrhh_clean/app/modules/airhsp/domain/entities/concepto_entity.dart';

List<ConceptoModel> conceptosModelFromXML(_data) {
  List<ConceptoModel> lista = [];

  var document = XmlDocument.parse(_data);

  var toto = document
      .findElements('remuneraciones')
      .first
      .findElements('rows')
      .first
      .findElements("row");
  var cells = toto.map((cell) => cell.findAllElements('cell'));
  cells.forEach((f) {
    var item = Map<String, dynamic>();
    for (var i = 0; i < f.length; i++) {
      switch (i) {
        case 0:
          item['concepto'] = f.toList()[i].text.trim();
          break;
        case 1:
          item['descripcion'] = f.toList()[i].text.trim();
          break;
        case 2:
          item['monto'] = f.toList()[i].text.trim();
          break;
        case 7:
          item['fuente'] = f.toList()[i].text.trim();
          break;
      }
    }
    lista.add(ConceptoModel.fromMap(item));
  });
  return lista;
}

ConceptoModel conceptoModelFromJson(String str) =>
    ConceptoModel.fromJson(json.decode(str));

String conceptoModelToJson(ConceptoModel data) => json.encode(data.toJson());

class ConceptoModel extends ConceptoEntity {
  ConceptoModel({
    required concepto,
    required descripcion,
    required monto,
    required fuente,
  }) : super(
            concepto: concepto,
            descripcion: descripcion,
            monto: monto,
            fuente: fuente);

  factory ConceptoModel.fromJson(Map<String, dynamic> json) =>
      new ConceptoModel(
        concepto: json["concepto"],
        descripcion: json["descripcion"],
        monto: json["monto"],
        fuente: json["fuente"],
      );

  factory ConceptoModel.fromMap(Map<String, dynamic> json) => new ConceptoModel(
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
}
