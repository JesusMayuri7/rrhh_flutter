import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/alta_baja_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/updated_prac_use_case.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

abstract class IPracRepository {
  Future<Either<Failure, List<PracticanteEntity>>> listarPrac(String anio);
  Future<Either<Failure, ResponseModel>> altaBajaPrac(ParamsAltaBaja params);
  Future<Either<Failure, List<ResponseEntity>>> getDataInitial(String anio);
  Future<Either<Failure, ResponseModel>> updatedPrac(UpdatedPracParams params);
}
