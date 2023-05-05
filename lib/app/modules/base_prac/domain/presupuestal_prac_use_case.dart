import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_prac_repository.dart';

class PresupuestalPracUseCase implements UseCase<List<ResponseEntity>, String> {
  final IPracRepository repository;

  PresupuestalPracUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(String anio) async {
    return await repository.getPresupuestalPracRepository(anio);
  }
}