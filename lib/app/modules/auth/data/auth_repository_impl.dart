import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/auth/data/i_auth_core_datasource.dart';
import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/session_entity.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../domain/auth_repository.dart';

class AuthRepositoyImpl implements IAuthReposity {
  final IAuthCoreDataSource iAuthCoreDataSource;
  AuthRepositoyImpl({
    required this.iAuthCoreDataSource,
  });

  @override
  Future<Either<Failure, SessionEntity>> loginEmailPassword(
      AuthCoreParams params) async {
    try {
      final result = await this.iAuthCoreDataSource.login(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
