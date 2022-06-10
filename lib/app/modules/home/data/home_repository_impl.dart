import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/home/data/i_get_home_cap_estado_opp_datasource.dart';
import 'package:rrhh_clean/app/modules/home/data/i_get_home_data_initial_datasource.dart';
import 'package:rrhh_clean/app/modules/home/data/i_get_home_devengado_total_datasource.dart';
import 'package:rrhh_clean/app/modules/home/domain/i_home_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IGetHomeDevengadoTotalDatasource getHomeDevengadoTotalDatasource;
  final IGetHomeCapEstadoOppDatasource getHomeCapEstadoOppDatasource;
  final IGetHomeDataInitialDatasource getHomeDataInitialDatasource;

  HomeRepositoryImpl({
    required this.getHomeDevengadoTotalDatasource,
    required this.getHomeCapEstadoOppDatasource,
    required this.getHomeDataInitialDatasource,
  });

  @override
  Future<Either<Failure, ResponseModel>> getHomeDevengadoTotal() async {
    try {
      final result =
          await this.getHomeDevengadoTotalDatasource.getHomeDevengadoTotal();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> getHomeCapEstadoOpp() async {
    try {
      final result = await this.getHomeCapEstadoOppDatasource.getCapEstadoOpp();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseModel>>> getHomeDataInitial() async {
    try {
      final result =
          await this.getHomeDataInitialDatasource.getHomeDataInitial();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
