import 'dart:convert';

import '../../domain/entities/parameter_cap_entity.dart';

List<ParameterCapModel> parameterCapModelFromJson(String str) {
  List<dynamic> parameterCapJson = json.decode(str);
  return List<ParameterCapModel>.from(
      parameterCapJson.map((x) => ParameterCapModel.fromJson(x)));
}

class ParameterCapModel extends ParameterCapEntity {
  ParameterCapModel(
      {required int id,
      required String dscVariable,
      required int modalidadId,
      required String anio,
      required String detalle,
      required String tipo,
      required double valor,
      required String abreviatura,
      required String frecuencia,
      required String modalidadEntrega,
      required List<int> meses})
      : super(
            id: id,
            dscVariable: dscVariable,
            modalidadId: modalidadId,
            anio: anio,
            detalle: detalle,
            tipo: tipo,
            valor: valor,
            abreviatura: abreviatura,
            frecuencia: frecuencia,
            modalidadEntrega: modalidadEntrega,
            meses: meses);

  factory ParameterCapModel.fromJson(Map<String, dynamic> json) {
    return ParameterCapModel(
        id: json["id"],
        dscVariable: json["dsc_variable"],
        modalidadId: json["modalidad_id"],
        anio: json["anio"],
        detalle: json["detalle"],
        tipo: json["tipo"],
        valor: double.parse(json["valor"] ?? 0),
        abreviatura: json['abreviatura'] ?? '',
        meses: List<int>.from((jsonDecode(json['meses']))),
        frecuencia: json['frecuencia'] ?? '',
        modalidadEntrega: json['modalidad_entrega'] ?? '');
  }
}
