import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetLiquidacionCasDatasource {
  Future<ResponseModel> getListLiquidacionCas(String anio);
}
