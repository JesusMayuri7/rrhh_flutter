import 'dart:convert';

import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

List<ModalidadModel> modalidadModelFromJson(String str) {
  List<dynamic> modalidadJson = json.decode(str);
  return List<ModalidadModel>.from(
      (modalidadJson).map((x) => ModalidadModel.fromJson(x)));
}

class ModalidadModel extends ModalidadEntity {
  ModalidadModel({id, dscModalidad})
      : super(id: id, dsc_modalidad: dscModalidad);

  factory ModalidadModel.fromJson(Map<String, dynamic> json) => ModalidadModel(
        id: json["id"],
        dscModalidad: json["dsc_modalidad"],
      );
}
