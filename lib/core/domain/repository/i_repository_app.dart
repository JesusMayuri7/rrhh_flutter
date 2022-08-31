import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import 'package:rrhh_clean/core/errors/failure.dart';

abstract class IRepositoryApp {
  Future<Either<Failure, ResponseEntity>> getClasificadores(String anio);
  Future<Either<Failure, ResponseEntity>> getMetas(String anio);
  Future<Either<Failure, ResponseEntity>> getAreas();
  Future<Either<Failure, ResponseEntity>> getCertificados(String anio);
}
