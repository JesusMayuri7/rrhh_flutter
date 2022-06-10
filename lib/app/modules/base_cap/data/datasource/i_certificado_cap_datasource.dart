import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class ICertificadoCapDatasource {
  Future<ResponseModel> getCertificadoCap(String anio);
}
