import 'package:rrhh_clean/core/domain/entities/presupuesto_entity.dart';

import 'cap_entity.dart';
import 'parameter_cap_entity.dart';

class ParamsCapCalcular {
  final List<CapEntity> listCap;
  final List<ParameterCapEntity> listParameter;
  final List<PresupuestoEntity> certificadoCap;
  final List<PresupuestoEntity> pimCap;

  ParamsCapCalcular({
    required this.listCap,
    required this.listParameter,
    required this.certificadoCap,
    required this.pimCap,
  });
}
