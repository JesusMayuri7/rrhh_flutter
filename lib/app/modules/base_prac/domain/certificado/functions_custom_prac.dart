import 'package:rrhh_clean/app/modules/base_cas/domain/entities/base_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';

void addClasificadorInCertificadoPrac(List<PresupuestoCasEntity> _certificado,
    BaseCasEntity _baseCasEntity, String clasificador) {
  _certificado.add(PresupuestoCasEntity(
      anoEje: 2023,
      fuente: _baseCasEntity.fuenteBase,
      producto: _baseCasEntity.producto,
      meta: _baseCasEntity.meta2020,
      clasificador: clasificador));
}

void addClasificadorInPresupuestoPrac(List<PresupuestoCasEntity> _presupuestoList,
    PresupuestoCasEntity _presupuesto, String clasificador) {
  _presupuestoList.add(PresupuestoCasEntity(
      anoEje: 2023,
      fuente: _presupuesto.fuente,
      producto: _presupuesto.producto,
      meta: _presupuesto.meta,
      clasificador: clasificador));
}


