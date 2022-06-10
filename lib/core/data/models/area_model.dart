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
    orgAreaId,
    descArea,
  }) : super(descArea: descArea, orgAreaId: orgAreaId);

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        orgAreaId: json["org_area_id"],
        descArea: json["desc_area"],
      );

  Map<String, dynamic> toJson() => {
        "org_area_id": orgAreaId,
        "desc_area": descArea,
      };
}
