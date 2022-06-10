import 'dart:convert';

import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';

List<FuenteModel> fuenteModelFromJson(String str) {
  List<dynamic> metaJson = json.decode(str);
  return List<FuenteModel>.from((metaJson).map((x) => FuenteModel.fromJson(x)));
}

String fuenteModelToJson(List<FuenteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FuenteModel extends FuenteEntity {
  FuenteModel({
    required int id,
    required String dscFuente,
    required String abvFuente,
  }) : super(id: id, dscFuente: dscFuente, abvFuente: abvFuente);

  factory FuenteModel.fromJson(Map<String, dynamic> json) => FuenteModel(
        id: json["id"],
        dscFuente: json["dsc_fuente"],
        abvFuente: json["abv_fuente"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dsc_fuente": dscFuente,
        "abv_fuente": abvFuente,
      };
}
