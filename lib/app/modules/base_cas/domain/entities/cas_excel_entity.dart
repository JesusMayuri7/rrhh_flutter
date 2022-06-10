import 'dart:convert';

class CasExcelEntity {
  final String plaza;
  final String fuente;

  CasExcelEntity({required this.plaza, required this.fuente});

  Map<String, dynamic> toMap() {
    return {
      'plaza': plaza,
      'fuente': fuente,
    };
  }

  factory CasExcelEntity.fromMap(Map<String, dynamic> map) {
    return CasExcelEntity(
      plaza: map['plaza'],
      fuente: map['fuente'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CasExcelEntity.fromJson(String source) =>
      CasExcelEntity.fromMap(json.decode(source));

  @override
  String toString() => 'CasExcel(plaza: $plaza, fuente: $fuente)';
}
