import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/add_liquidacion_usecase.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IAddLiquidacionDatasource {
  Future<ResponseModel> addLiquidacion(ParamsAddLiquidacion params);
}
