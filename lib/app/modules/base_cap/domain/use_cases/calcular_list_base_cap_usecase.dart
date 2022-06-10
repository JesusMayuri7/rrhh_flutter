import 'package:rrhh_clean/app/modules/base_cap/domain/entities/cap_entity.dart';
import 'package:rrhh_clean/app/modules/base_cap/domain/entities/parameter_cap_entity.dart';

class CalcularListBaseCapUseCase {
  List<CapEntity> call(ParamsCalcularListBaseCap params) {
    for (final item in params.capEntityList) {
      item.copyWith(totalBasico: item.montoEscala + item.asigFam);
      print(item);
      params.parameterCapEntityList.map((e) {
        if (e.detalle == 'PORCENTAJE_EPS_ESSALUD')
          item.copyWith(essalud: item.montoEscala * e.valor);
        if (e.detalle == 'PORCENTAJE_EPS_SALUD')
          item.copyWith(epsSalud: item.montoEscala * e.valor);
      }).toList();
    }
    return params.capEntityList;
  }
}

class ParamsCalcularListBaseCap {
  final List<CapEntity> capEntityList;
  final List<ParameterCapEntity> parameterCapEntityList;

  ParamsCalcularListBaseCap({
    required this.capEntityList,
    required this.parameterCapEntityList,
  });
}
