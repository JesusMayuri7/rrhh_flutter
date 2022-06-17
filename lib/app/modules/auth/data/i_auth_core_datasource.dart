import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/app/modules/auth/data/auth_response_model.dart';

abstract class IAuthCoreDataSource {
  Future<LoginResponseModel> login(AuthCoreParams params);
}
