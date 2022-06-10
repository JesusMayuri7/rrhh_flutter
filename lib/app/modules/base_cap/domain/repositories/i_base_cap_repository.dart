import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/errors/failure.dart';

abstract class IBaseCapRepository {
  Future<Either<Failure, ResponseEntity>> getListBaseCap(String anio);
  Future<Either<Failure, ResponseEntity>> getParameterBaseCap(String anio);
  Future<Either<Failure, List<ResponseEntity>>> getPresupuestoBaseCap(
      String anio);
}
