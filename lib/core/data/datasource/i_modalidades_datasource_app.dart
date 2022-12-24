import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IModalidadesDatasourceApp {
  Future<ResponseModel> getModalidades(String anio);
}
