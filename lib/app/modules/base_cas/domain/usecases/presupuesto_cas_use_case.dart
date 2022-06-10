import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../repositories/i_listar_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class PresupuestoCasUseCase implements UseCase<List<ResponseEntity>, String> {
  final IListarRepository repository;

  PresupuestoCasUseCase(this.repository);

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(String anio) async {
    return await repository.getPresupuestoRepository(anio);
  }
}
