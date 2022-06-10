import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IInitialCasDatasource {
  Future<ResponseModel> initial(
      {required String dscVariable,
      required int modalidadId,
      required String anio});
}
