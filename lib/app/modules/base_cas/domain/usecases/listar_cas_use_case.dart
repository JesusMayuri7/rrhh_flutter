import 'package:dartz/dartz.dart';
import '../entities/base_cas_entity.dart';
import '../repositories/i_listar_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class ListarCasUseCase implements UseCase<List<BaseCasEntity>, String> {
  final IListarRepository repository;

  ListarCasUseCase(this.repository);

  @override
  Future<Either<Failure, List<BaseCasEntity>>> call(String anio) async {
    return await repository.listarBaseCas(anio);
  }
}
