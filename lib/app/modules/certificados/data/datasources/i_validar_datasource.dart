import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IValidarDatasource {
  Future<ResponseModel> validarCertificado(
      {required String certiificado, required String anio});
}
