import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetLiquidacionReportDatasource {
  Future<ResponseModel> getLiquidacionReport(String anio);
}
