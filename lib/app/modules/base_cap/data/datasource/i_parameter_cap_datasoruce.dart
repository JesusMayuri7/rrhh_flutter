import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IParameterCapDataSoruce {
  Future<ResponseModel> getParameters(String anio);
}
