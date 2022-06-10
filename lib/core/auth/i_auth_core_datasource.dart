import 'package:rrhh_clean/core/auth/login_auth_usecase.dart';
import 'package:rrhh_clean/core/auth/auth_response_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IAuthCoreDataSource {
  Future<LoginResponseModel> login(AuthCoreParams params);
}
