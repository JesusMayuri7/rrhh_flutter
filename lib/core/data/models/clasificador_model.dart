import 'dart:convert';

import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';

List<ClasificadorModel> clasificadorFromJson(String str) {
  List<dynamic> clasificadorJson = json.decode(str);
  return List<ClasificadorModel>.from(
      (clasificadorJson).map((x) => ClasificadorModel.fromJson(x)));
}

String clasificadorToJson(List<ClasificadorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClasificadorModel extends ClasificadorEntity {
  ClasificadorModel({
    id,
    dscClasificador,
  }) : super(id: id, dscClasificador: dscClasificador);

  factory ClasificadorModel.fromJson(Map<String, dynamic> json) =>
      ClasificadorModel(
        id: json["id"],
        dscClasificador: json["dsc_clasificador"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dsc_clasificador": dscClasificador,
      };
}
