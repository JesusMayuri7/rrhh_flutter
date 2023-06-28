import 'package:dson_adapter/dson_adapter.dart';
import 'dart:convert';

import '../../domain/entities/airhsp_ext_entity.dart';

List<AirhspExtModel> airhspExtModelFromJson(dynamic str) =>
    List<AirhspExtModel>.from(
        (str).map((x) => AirhspExtModel.listFromJson(json: x)));

class AirhspExtModel extends AirhspExtEntity {
  AirhspExtModel(
      {
        required super.id,
        required super.codigoPlaza,
        required super.modalidadId,
        required super.datoLaboral
       });

  factory AirhspExtModel.fromJson({
    required dynamic json,
  }) {
    return DSON().fromJson(json, AirhspExtModel.new
    ,resolvers: [(key,value) {
      print('keys '+key);
      if(key=='datoLaboral') {
        print(key);
         return jsonDecode(value);
      }
      return value;
    }]);    
  }

    factory AirhspExtModel.listFromJson({required Map<String, dynamic> json}) {
      return new AirhspExtModel(
        id: json["id"] ?? 0,
        modalidadId: json["modalidaId"] ?? 0,
        codigoPlaza: json["codigoPlaza"] ?? '',
        datoLaboral: List<Map<String,dynamic>>.from(json["datoLaboral"]).map((e) {
          return e;
        }
        ).toList(),
      );
    }
}
