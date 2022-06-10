import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class ICertificadoCasDatasource {
  Future<ResponseModel> getCertificadoCas(String anio);
}
