import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IPimCasDatasource {
  Future<ResponseModel> getPimCas(String anio);
}
