import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/session_entity.dart';

import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'auth_repository.dart';

class LoginAuthUseCase implements UseCase<SessionEntity, AuthCoreParams> {
  final IAuthReposity iAuthRepository;
  LoginAuthUseCase({
    required this.iAuthRepository,
  });

  @override
  Future<Either<Failure, SessionEntity>> call(AuthCoreParams params) async {
    return await this.iAuthRepository.loginEmailPassword(params);
  }
}

class AuthCoreParams {
  String email;
  String password;
  String anio;
  AuthCoreParams({this.email = '', this.password = '', this.anio = ''});

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password, 'anio': anio};
  }

  @override
  String toString() =>
      'AuthCoreParams(email: $email, password: $password, anio: $anio)';
}
