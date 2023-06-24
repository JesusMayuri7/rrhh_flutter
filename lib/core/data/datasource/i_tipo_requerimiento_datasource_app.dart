import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class ITpoRequerimientoDatasourceApp {
  Future<ResponseModel> getTipoRequerimientos(String anio);
}