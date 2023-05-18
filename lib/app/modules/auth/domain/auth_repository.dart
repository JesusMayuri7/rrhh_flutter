import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/session_entity.dart';
import 'package:rrhh_clean/core/errors/failure.dart';


abstract class IAuthReposity {
  Future<Either<Failure, SessionEntity>> loginEmailPassword(
      AuthCoreParams params);
}
