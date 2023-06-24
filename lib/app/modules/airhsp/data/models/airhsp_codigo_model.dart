import 'package:dson_adapter/dson_adapter.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_codigo_entity.dart';

List<AirhspCodigoModel> airhspCodigoModelFromJson(dynamic str) =>
    List<AirhspCodigoModel>.from(
        (str).map((x) => AirhspCodigoModel.fromJson(json: x)));

class AirhspCodigoModel extends AirhspCodigo {
  AirhspCodigoModel({
  required super.id, 
  required super.anio, 
  required super.modalidadId,
  required super.descModalidad,
  required super.codigo, 
  required super.descCodigo, 
  required super.descAbreviatura, 
  required super.modalidadEntrega, 
  required super.frecuenciaEntrega, 
  required super.frecuenciaMes, 
  required super.tipoCodigo, 
  required super.afecto, 
  required super.estado});
  
  factory AirhspCodigoModel.fromJson({
    required dynamic json,
  }) {
    return DSON().fromJson(json, AirhspCodigoModel.new, aliases: {
      AirhspCodigoModel: {        
        'modalidadId':'modalidad_id',
        'descModalidad':'dsc_modalidad',
        'descCodigo':'desc_codigo',
        'descAbreviatura':'desc_abreviatura',
        'modalidadEntrega':'modalidad_entrega',
        'frecuenciaEntrega':'frecuencia_entrega',
        'frecuenciaMes':'frecuencia_mes',
        'tipoCodigo':'tipo',                
      }
    },resolvers: [(key,value) {
      if(key=='frecuenciaMes' && value == null) {
         return '';
      }
      return value;
    }]);
  }
}
