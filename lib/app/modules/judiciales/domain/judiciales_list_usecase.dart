import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_judiciales_repository.dart';

class JudicialesListUseCase extends UseCase<ResponseEntity, ParamsJudiciales> {
  final IJudicialesRepository iJudicialesRepository;

  JudicialesListUseCase({required this.iJudicialesRepository});

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsJudiciales params) async {
    return await iJudicialesRepository.getListJudiciales(params);
  }
}

class ParamsJudiciales {
  final String anio;

  ParamsJudiciales({
    required this.anio,
  });
}
