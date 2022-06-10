import 'dart:convert';

import '../../domain/entities/concepto_entity.dart';

List<ConceptoModel> conceptoFromJson(String str) {
  List<dynamic> conceptoJson = json.decode(str);
  return List<ConceptoModel>.from(
      (conceptoJson).map((x) => ConceptoModel.fromJson(x)));
}

String conceptoModelToJson(List<ConceptoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConceptoModel extends ConceptoEntity {
  ConceptoModel({
    id,
    dscConcepto,
  }) : super(id: id, dscConcepto: dscConcepto);

  factory ConceptoModel.fromJson(Map<String, dynamic> json) => ConceptoModel(
        id: json["id"],
        dscConcepto: json["dsc_concepto"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dsc_concepto": dscConcepto,
      };
}
