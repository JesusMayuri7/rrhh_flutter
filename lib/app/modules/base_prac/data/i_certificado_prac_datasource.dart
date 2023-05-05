import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class ICertificadoPracDatasource {
  Future<ResponseModel> getCertificadoPrac(String anio);
}