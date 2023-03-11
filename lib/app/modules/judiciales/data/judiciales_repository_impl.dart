// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/judiciales/data/datasource/i_judiciales_new_detail_datasource.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/new_judicial_detail_use_case.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../domain/i_judiciales_repository.dart';
import '../domain/judiciales_list_usecase.dart';
import '../domain/new_judiciales_use_case.dart';
import 'datasource/i_judiciales_init_datasource.dart';
import 'datasource/i_judiciales_list_datasource.dart';
import 'datasource/i_judiciales_new_datasource.dart';

class JudicialesRepositoryImpl implements IJudicialesRepository {
  final IJudicialesListDataSource iJudicialesListDataSource;
  final IJudicialesNewDataSource iJudicialesNewDataSource;
  final IJudicialesInitDatasource iJudicialesInitialDatasource;
  final IJudicialesNewDetailDataSource iJudicialesNewDetailDataSource;

  JudicialesRepositoryImpl({
    required this.iJudicialesListDataSource,
    required this.iJudicialesNewDataSource,
    required this.iJudicialesInitialDatasource,
    required this.iJudicialesNewDetailDataSource,
  });

  @override
  Future<Either<Failure, ResponseEntity>> getListJudiciales(
      ParamsJudiciales params) async {
    try {
      final list =
          await this.iJudicialesListDataSource.getListJudiciales(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

/*   @override
  Future<Either<Failure, ResponseEntity>> updateJudicial(
      ParamsUpdateJudicial params) async {
    try {
      final list =
          await this.iJudicialesUpdateDataSource.updateJudiciales(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  } */

  @override
  Future<Either<Failure, ResponseEntity>> newJudicial(
      ParamsNewJudicial params) async {
    try {
      final list = await this.iJudicialesNewDataSource.newJudicial(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getInitialJudicial(
      String anio) async {
    try {
      final list = await this.iJudicialesInitialDatasource.getDataInit(anio);
      return Right(list);
      //throw ('error');
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> newJudicialDetail(ParamsNewJudicialDetail params) async {
    try {
      final list = await this.iJudicialesNewDetailDataSource.newJudicialDetail(params);
      return Right(list);
      //throw ('error');
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
