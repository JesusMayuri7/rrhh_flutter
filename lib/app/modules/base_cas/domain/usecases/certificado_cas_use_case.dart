import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import '../repositories/i_listar_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class CertificadoCasUseCase implements UseCase<ResponseEntity, String> {
  final IListarRepository repository;

  CertificadoCasUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await repository.getCerticadoCasRepository(anio);
  }
}
