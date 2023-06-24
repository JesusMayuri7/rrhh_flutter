import 'package:dson_adapter/dson_adapter.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';

List<AirhspPresupuestoModel> airhspPresupuestoModelFromJson(dynamic str) =>
    List<AirhspPresupuestoModel>.from(
        (str).map((x) => AirhspPresupuestoModel.fromJson(json: x)));

class AirhspPresupuestoModel extends AirhspPresupuestoEntity {
  AirhspPresupuestoModel(
      {required super.plaza,
      required super.descGrupoOcupacional,
      required super.dni,
      required super.nombres,
      required super.cargo,
      required super.nivel,
      required super.establecimiento,
      required super.dependencia,
      required super.estado,
      required super.fuente,
      required super.remPrinRO,
      required super.remPrinRDR,
      required super.essalud,
      required super.bonificacionFamiliar,
      required super.incremento,
      required super.escolaridad, 
      required super.gratificacionJulio, 
      required super.gratificacionDiciembre, 
      required super.bonificacionExtraordinariaJulio,
       required super.bonificacionExtraordinariaDiciembre,
        required super.ctsMayo, 
        required super.ctsNoviembre,
      });
  factory AirhspPresupuestoModel.fromJson({
    required dynamic json,
  }) {
    return DSON().fromJson(json, AirhspPresupuestoModel.new, aliases: {
      AirhspPresupuestoModel: {
        'plaza': 'codigo_plaza',
        'descGrupoOcupacional':'desc_grupo_ocupacional',
        'dni': 'numero_documento',
        'cargo': 'desc_cargo_funcional',
        'nivel': 'desc_cargo_estructural',
        'establecimiento': 'desc_establecimiento',
        'dependencia': 'desc_unidad_organica',
        'fuente': 'fuente_air',
        'remPrinRO': 'RemPrinRO',
        'remPrinRDR': 'RemPrinRDR',
        'essalud': 'Essalud',
        'bonificacionFamiliar': 'BonFam',
        'incremento': 'Incremento',
        'escolaridad': 'BonifEsco',
        'gratificacionJulio': 'BoniPatrias',
        'gratificacionDiciembre': 'BoniNavidad',
        'bonificacionExtraordinariaJulio': 'BoniExtJulio',
        'bonificacionExtraordinariaDiciembre': 'BoniExtDic',
        'ctsMayo':'CtsMayo',
        'ctsNoviembre':'CtsNov',
      }
    });
  }
}
