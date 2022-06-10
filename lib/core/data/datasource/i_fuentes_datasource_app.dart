import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IFuentesDatasourceApp {
  Future<ResponseModel> getFuentes(String anio);
}
