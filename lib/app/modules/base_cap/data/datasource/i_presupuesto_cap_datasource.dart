import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IPresupuestoCapDatasource {
  Future<List<ResponseModel>> getPresupuestoCap(String anio);
}
