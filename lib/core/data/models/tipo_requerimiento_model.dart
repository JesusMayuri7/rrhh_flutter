import 'package:dson_adapter/dson_adapter.dart';
import 'package:rrhh_clean/core/domain/entities/tipo_requerimiento_entity.dart';

List<TipoRequerimientoModel> tipoRequerimientoModelFromJson(dynamic str) =>
    List<TipoRequerimientoModel>.from(
        (str).map((x) => TipoRequerimientoModel.fromJson(json: x)));

class TipoRequerimientoModel extends TipoRequerimientoEntity {
  TipoRequerimientoModel({
  required super.id, 
  required super.anio, 
  required super.descTipoRequerimiento,
  required super.isActivo});
  
  factory TipoRequerimientoModel.fromJson({
    required dynamic json,
  }) {
    return DSON().fromJson(json, TipoRequerimientoModel.new, aliases: {
      TipoRequerimientoModel: {                
        'descTipoRequerimiento':'desc_tipo_requerimiento',
        'isActivo':'is_activo'                     
      }
    });
  }
}