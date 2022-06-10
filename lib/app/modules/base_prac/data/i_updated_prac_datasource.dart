import 'package:rrhh_clean/app/modules/base_prac/domain/updated_prac_use_case.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IUpdatedPracDataSource {
  Future<ResponseModel> updatedPrac(UpdatedPracParams params);
}
