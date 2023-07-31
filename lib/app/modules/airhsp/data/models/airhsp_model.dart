import 'dart:convert';

import 'package:xml/xml.dart';

import '../../domain/entities/airhsp_entity.dart';

List<AirHspModel> airHspModelFromJson(List<dynamic> str) =>
    List<AirHspModel>.from((str).map((x) => AirHspModel.fromJson(x)));

List<AirHspModel> airHspModelFromXML(_data) {
  var document = XmlDocument.parse(_data);

  List<AirHspModel> lista = [];
  var toto = document
      .findElements('plazas')
      .first
      .findElements('rows')
      .first
      .findElements("row");

  var cells = toto.map((cell) => cell.findAllElements('cell'));

  //sin data
  print(cells.toString());
          
  cells.forEach((f) {
    var item = Map<String, dynamic>();
    for (var i = 0; i < f.length; i++) {
      switch (i) {
        case 2:
          item['plaza'] = f.toList()[i].value == null ? "000000" : f.toList()[i].value!.trim();
          break;
        case 5:
          item['nombres'] = f.toList()[i].value == null ? "" : f.toList()[i].value!.trim();
          break;
        case 6:
          item['cargo'] = f.toList()[i].value == null ? "" : f.toList()[i].value!.trim();
          break;
        case 7:
          item['nivel'] = f.toList()[i].value == null ? "" : f.toList()[i].value!.trim();
          break;
        case 8:
          item['establecimiento'] = f.toList()[i].value == null ? "" : f.toList()[i].value!.trim();
          break;
        case 9:
          item['dependencia'] = f.toList()[i].value == null ? "" : f.toList()[i].value!.trim();
          break;
        case 13:
          item['estado'] = f.toList()[i].value == null ? "" : f.toList()[i].value!.trim();
          break;
        case 14:
          item['dni'] = f.toList()[i].value == null ? "" : f.toList()[i].value!.trim();
          break;
      }
    }
    lista.add(AirHspModel.fromMap(item));
  });

  return lista;
}

AirHspModel airHspModelFromMap(Map<String, dynamic> str) =>
    AirHspModel.fromMap(str);

String airHspModelToJson(List<AirHspModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AirHspModel extends AirhspEntity {
  AirHspModel(
      {required String plaza,
      required String nombres,
      required String cargo,
      required String nivel,
      required String establecimiento,
      required String dependencia,
      required String estado,
      required String dni,
      required int estadoCant})
      : super(
            plaza: plaza,
            nombres: nombres,
            cargo: cargo,
            nivel: nivel,
            establecimiento: establecimiento,
            dependencia: dependencia,
            estado: estado,
            dni: dni,
            estadoCant: estadoCant);

  factory AirHspModel.fromJson(Map<String, dynamic> json) => new AirHspModel(
        plaza: json["plaza"],
        nombres: json["nombres"],
        cargo: json["cargo"],
        nivel: json["nivel"],
        establecimiento: json["establecimiento"],
        dependencia: json["dependencia"],
        estado: json["estado"],
        estadoCant: json["estado"] == 'O' ? 1 : 0,
        dni: json["dni"],
      );

  factory AirHspModel.fromMap(Map<String, dynamic> json) => new AirHspModel(
        plaza: json["plaza"],
        nombres: json["nombres"],
        cargo: json["cargo"],
        nivel: json["nivel"],
        establecimiento: json["establecimiento"],
        dependencia: json["dependencia"],
        estado: json["estado"],
        estadoCant: json["estado"] == 'O' ? 1 : 0,
        dni: json["dni"],
      );

  Map<String, dynamic> toJson() => {
        "plaza": plaza,
        "nombres": nombres,
        "cargo": cargo,
        "nivel": nivel,
        "establecimiento": establecimiento,
        "dependencia": dependencia,
        "estado": estado,
        "estadoCant": estadoCant,
        "dni": dni,
      };

/*
  List<AirHspModel> fromXML(String _data) {
    var document = XmlDocument.parse(_data);

    List<AirHspModel> lista = [];

    var toto = document.findElements('rows').first.findElements("row");
    var cells = toto.map((cell) => cell.findAllElements('cell'));
    final item = AirHspModel();
    cells.forEach((f) {
      for (var i = 0; i < f.length; i++) {
        switch (i) {
          case 1:
            item.plaza = f.toList()[i].value!.trim();
            break;
          case 4:
            item.nombres = f.toList()[i].value!.trim();
            break;
          case 5:
            item.cargo = f.toList()[i].value!.trim();
            break;
          case 6:
            item.nivel = f.toList()[i].value!.trim();
            break;
          case 7:
            item.establecimiento = f.toList()[i].value!.trim();
            break;
          case 8:
            item.dependencia = f.toList()[i].value!.trim();
            break;
          case 12:
            item.estado = f.toList()[i].text;
            break;
          case 13:
            item.dni = f.toList()[i].text;
            break;
        }
      }
      lista.add(item);
    });
    return lista;
    //return listaAir;
  }*/
}
