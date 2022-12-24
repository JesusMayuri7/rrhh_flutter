import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'requerimiento_new_usecase.dart';

abstract class IRequerimientoRepository {
  Future<Either<Failure, ResponseEntity>> getListRequerimiento(
      ParamsRequerimiento params);

  Future<Either<Failure, List<ResponseEntity>>> getInitialRequerimiento(
      String anio);
  Future<Either<Failure, ResponseEntity>> newRequerimiento(
      ParamsNewRequerimiento params);
}
