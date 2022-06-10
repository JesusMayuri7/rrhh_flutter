import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetSubsidioDevolucionDatasource {
  Future<ResponseModel> getSubsidioDevolucion(String anio);
}
