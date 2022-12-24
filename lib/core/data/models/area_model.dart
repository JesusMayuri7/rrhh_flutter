import 'dart:convert';

import '../../domain/entities/area_entity.dart';

List<AreaModel> areaModelFromJson(String str) {
  List<dynamic> areaJson = json.decode(str);
  return List<AreaModel>.from((areaJson).map((x) => AreaModel.fromJson(x)));
}

String areaModelToJson(List<AreaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AreaModel extends AreaEntity {
  AreaModel({
    id,
    descArea,
  }) : super(descArea: descArea, id: id);

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        id: json["id"],
        descArea: json["desc_area"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "desc_area": descArea,
      };
}
