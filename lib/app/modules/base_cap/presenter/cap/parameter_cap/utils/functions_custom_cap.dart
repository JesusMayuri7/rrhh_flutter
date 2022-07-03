import 'package:rrhh_clean/core/domain/entities/presupuesto_entity.dart';

void addClasificadorInCertificadoCap(
    int _anio,
    List<PresupuestoEntity> _certificadoList,
    PresupuestoEntity _certificado,
    String clasificador) {
  _certificadoList.add(PresupuestoEntity(
      anoEje: _anio,
      fuente: _certificado.fuente,
      producto: _certificado.producto,
      meta: _certificado.meta,
      subgenerica: '',
      dscClasificadorExt: '',
      especifica3: clasificador));
}

void addClasificadorInPresupuestoCap(
    int _anio,
    List<PresupuestoEntity> _presupuestoList,
    PresupuestoEntity _presupuesto,
    String clasificador) {
  _presupuestoList.add(PresupuestoEntity(
      anoEje: _anio,
      fuente: _presupuesto.fuente,
      producto: _presupuesto.producto,
      meta: _presupuesto.meta,
      dscClasificadorExt: '',
      subgenerica: '',
      especifica3: clasificador));
}
