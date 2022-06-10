import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IListCapDataSoruce {
  Future<ResponseModel> listar(String anio);
}
