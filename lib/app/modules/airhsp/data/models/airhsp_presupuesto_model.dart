import 'package:dson_adapter/dson_adapter.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';

List<AirhspPresupuestoModel> airhspPresupuestoModelFromJson(dynamic str) =>
    List<AirhspPresupuestoModel>.from(
        (str).map((x) => AirhspPresupuestoModel.fromJson(json: x)));

class AirhspPresupuestoModel extends AirhspPresupuestoEntity {
  AirhspPresupuestoModel(
      {required super.plaza,
      required super.dni,
      required super.nombres,
      required super.cargo,
      required super.nivel,
      required super.establecimiento,
      required super.dependencia,
      required super.estado,
      required super.remPrinRO,
      required super.remPrinRDR,
      required super.essalud,
      required super.bonificacionFamiliar,
      required super.incremento});
  factory AirhspPresupuestoModel.fromJson({
    required dynamic json,
  }) {
    return DSON().fromJson(json, AirhspPresupuestoModel.new, aliases: {
      AirhspPresupuestoModel: {
        'plaza': 'codigo_plaza',
        'dni': 'numero_documento',
        'cargo': 'desc_cargo_funcional',
        'nivel': 'desc_cargo_estructural',
        'establecimiento': 'desc_establecimiento',
        'dependencia': 'desc_unidad_organica',
        'remPrinRO': 'RemPrinRO',
        'remPrinRDR': 'RemPrinRDR',
        'essalud': 'Essalud',
        'bonificacionFamiliar': 'BonFam',
        'incremento': 'Incremento',
      }
    });
  }
}
