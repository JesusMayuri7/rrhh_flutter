import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IMetasDatasourceApp {
  Future<ResponseModel> getMetas(String anio);
}
