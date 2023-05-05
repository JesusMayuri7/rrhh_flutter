import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_prac_repository.dart';

class CertificadoPracUseCase implements UseCase<ResponseEntity, String> {
  final IPracRepository repository;

  CertificadoPracUseCase({required this.repository});

  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await repository.getCertificadoPracRepository(anio);
  }
}