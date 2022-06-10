import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IPimCapDatasource {
  Future<ResponseModel> getPimCap(String anio);
}
