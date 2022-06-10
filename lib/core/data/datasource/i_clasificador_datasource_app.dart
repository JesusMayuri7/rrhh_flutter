import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IClasificadorDatasourceApp {
  Future<ResponseModel> getClasificadores(String anio);
}
