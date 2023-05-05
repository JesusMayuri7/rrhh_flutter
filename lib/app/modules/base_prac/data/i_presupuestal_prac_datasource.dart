import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IPresupuestalPracDatasource {
  Future<List<ResponseModel>> getPresupuestalPrac(String anio);
}