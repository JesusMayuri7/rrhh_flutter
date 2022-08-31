import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'judiciales_list_usecase.dart';
import 'new_judiciales_use_case.dart';

abstract class IJudicialesRepository {
  Future<Either<Failure, ResponseEntity>> getListJudiciales(
      ParamsJudiciales params);
  Future<Either<Failure, ResponseEntity>> newJudicial(ParamsNewJudicial params);
  Future<Either<Failure, List<ResponseEntity>>> getInitialJudicial(String anio);
  // Future<Either<Failure, ResponseEntity>> updateJudicial(      ParamsUpdateJudicial params);
}
