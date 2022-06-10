import 'dart:convert';

import '../../domain/entities/cas_excel_entity.dart';

List<CasExcelModel> excelCasModelFromJson(String str) =>
    List<CasExcelModel>.from(
        json.decode(str).map((x) => CasExcelModel.fromJson(x)));

String excelCasModelToJson(List<CasExcelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CasExcelModel extends CasExcelEntity {
  CasExcelModel({required String plaza, required String fuente})
      : super(plaza: plaza, fuente: fuente);

  Map<String, dynamic> toMap() {
    return {
      'plaza': plaza,
      'fuente': fuente,
    };
  }

  factory CasExcelModel.fromMap(Map<String, dynamic> map) {
    return CasExcelModel(
      plaza: map['plaza'],
      fuente: map['fuente'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CasExcelModel.fromJson(String source) =>
      CasExcelModel.fromMap(json.decode(source));

  @override
  String toString() => 'CasExcel(plaza: $plaza, fuente: $fuente)';
}
