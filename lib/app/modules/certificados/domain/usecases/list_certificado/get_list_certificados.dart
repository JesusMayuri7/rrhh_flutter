import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import '../../repositories/i_certificados_repository.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/domain/use_cases/usecase.dart';

class GetListCertificadosUseCase implements UseCase<ResponseEntity, NoParams> {
  final ICertificadosRepository repository;

  GetListCertificadosUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseEntity>> call(NoParams params) async {
    return await repository.getListCertificados();
  }
}
