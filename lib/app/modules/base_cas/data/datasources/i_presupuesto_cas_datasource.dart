import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IPresupuestoCasDatasource {
  Future<List<ResponseModel>> getPresupuestoCas(String anio);
}
