import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IAreasDatasourceApp {
  Future<ResponseModel> getAreas(String anio);
}
