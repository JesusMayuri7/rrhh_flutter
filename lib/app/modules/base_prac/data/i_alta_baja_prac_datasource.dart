import 'package:rrhh_clean/app/modules/base_prac/domain/alta_baja_use_case.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IAltaBajaPracDataSource {
  Future<ResponseModel> altaBajaPrac(ParamsAltaBaja params);
}
