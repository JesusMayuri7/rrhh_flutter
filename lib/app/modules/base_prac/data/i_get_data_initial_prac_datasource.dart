import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetDataInitialPracDatasource {
  Future<List<ResponseModel>> getDataInitial(String anio);
}
