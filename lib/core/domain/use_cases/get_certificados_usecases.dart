import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/repository/i_repository_app.dart';
import 'package:rrhh_clean/core/errors/failure.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';

class GetCertificadosUseCase implements UseCase<ResponseEntity, String> {
  final IRepositoryApp repositoryApp;

  GetCertificadosUseCase({required this.repositoryApp});

  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await repositoryApp.getCertificados(anio);
  }
}
