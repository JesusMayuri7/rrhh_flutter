import 'dart:convert';

import '../../domain/entities/modalidad_entity.dart';

List<ModalidadModel> modalidadFromJson(String str) {
  List<dynamic> modalidadJson = json.decode(str);
  print(modalidadJson.toString());
  return List<ModalidadModel>.from(
      (modalidadJson).map((x) => ModalidadModel.fromJson(x)));
}

String modalidadToJson(List<ModalidadModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModalidadModel extends ModalidadEntity {
  ModalidadModel({
    id,
    dscModalidad,
  }) : super(id: id, dscModalidad: dscModalidad);

  factory ModalidadModel.fromJson(Map<String, dynamic> json) => ModalidadModel(
        id: json["id"],
        dscModalidad: json["dsc_modalidad"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dsc_modalidad": dscModalidad,
      };
}
