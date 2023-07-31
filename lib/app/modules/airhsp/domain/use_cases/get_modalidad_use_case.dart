import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/repositories/i_airhsp_respository.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/failure.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';

class GetModalidadUseCase implements UseCase<ResponseEntity, String> {
  final IAirhspRepository repositoryApp;

  GetModalidadUseCase({required this.repositoryApp});

  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await repositoryApp.getModalidad(anio);
  }
}