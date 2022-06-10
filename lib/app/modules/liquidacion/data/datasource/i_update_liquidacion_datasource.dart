import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/update_liquidacion_usecase.dart';

abstract class IUpdateLiquidacionDatasource {
  Future<Map<String, dynamic>> upddateLiquidacion(
      ParamsUpdateLiquidacion paramsUpdateLiquidacion);
}
