import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetLiquidacionResumenesDatasource {
  Future<List<ResponseModel>> getListLiquidacionResumenes(
      ParamsLiquidacionResumen paramsResumen);
}
