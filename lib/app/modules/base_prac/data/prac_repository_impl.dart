import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/base_prac/data/i_alta_baja_prac_datasource.dart';
import 'package:rrhh_clean/app/modules/base_prac/data/i_listar_prac_datasource.dart';
import 'package:rrhh_clean/app/modules/base_prac/data/i_updated_prac_datasource.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/alta_baja_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/i_prac_repository.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';

import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_get_data_initial_prac_datasource.dart';

class PracRepositoryImpl implements IPracRepository {
  final IListarPracDataSource iPracDataSource;
  final IAltaBajaPracDataSource iAltaBajaPracDataSource;
  final IGetDataInitialPracDatasource iGetDataInitialPracDatasource;
  final IUpdatedPracDataSource iUpdatedPracDataSource;

  PracRepositoryImpl({
    required this.iPracDataSource,
    required this.iAltaBajaPracDataSource,
    required this.iGetDataInitialPracDatasource,
    required this.iUpdatedPracDataSource,
  });

  @override
  Future<Either<Failure, List<PracticanteEntity>>> listarPrac(
      String anio) async {
    try {
      var list = await iPracDataSource.listarPrac(anio);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> altaBajaPrac(
      ParamsAltaBaja params) async {
    try {
      var list = await iAltaBajaPracDataSource.altaBajaPrac(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getDataInitial(
      String anio) async {
    try {
      final result =
          await this.iGetDataInitialPracDatasource.getDataInitial(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> updatedPrac(params) async {
    try {
      final result = await this.iUpdatedPracDataSource.updatedPrac(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
