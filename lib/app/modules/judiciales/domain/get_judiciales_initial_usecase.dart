import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_judiciales_repository.dart';

class GetJudicialesInitialUseCase
    implements UseCase<List<ResponseEntity>, String> {
  final IJudicialesRepository iJudicialesRepository;

  GetJudicialesInitialUseCase({
    required this.iJudicialesRepository,
  });

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(String anio) async {
    return await this.iJudicialesRepository.getInitialJudicial(anio);
  }
}
