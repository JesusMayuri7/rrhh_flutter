import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_codigo_use_case.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IAirhspCodigoDatasource {
  Future<ResponseModel> listar(ParamsCodigo paramsCodigo);
}