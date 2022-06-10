import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

abstract class IHomeRepository {
  Future<Either<Failure, ResponseModel>> getHomeDevengadoTotal();
  Future<Either<Failure, ResponseModel>> getHomeCapEstadoOpp();
  Future<Either<Failure, List<ResponseModel>>> getHomeDataInitial();
}
