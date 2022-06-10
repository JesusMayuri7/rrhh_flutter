import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetDataInitialDatasource {
  Future<List<ResponseModel>> getDataInitial(String anio);
}
