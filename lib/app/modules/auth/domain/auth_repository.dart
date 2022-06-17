import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'auth_response_entity.dart';

abstract class IAuthReposity {
  Future<Either<Failure, LoginResponseEntity>> loginEmailPassword(
      AuthCoreParams params);
}
