import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class ICertificadosDatasourceApp {
  Future<ResponseModel> getCertificados(String anio);
}
