import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetHomeCapEstadoOppDatasource {
  Future<ResponseModel> getCapEstadoOpp();
}
