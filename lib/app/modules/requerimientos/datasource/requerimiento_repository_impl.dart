// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/requerimientos/datasource/i_requerimiento_list_datasource.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/i_requerimiento_repository.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_new_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_requerimiento_initial_datasource.dart';

class RequerimientoRepositoryImpl implements IRequerimientoRepository {
  final IRequerimientoListDataSource iRequerimientoListDataSource;
  final IRequerimientosInitalDatasource iRequerimientoInitialDataSource;
  RequerimientoRepositoryImpl({
    required this.iRequerimientoListDataSource,
    required this.iRequerimientoInitialDataSource,
  });
  @override
  Future<Either<Failure, ResponseEntity>> getListRequerimiento(
      ParamsRequerimiento params) async {
    try {
      final list =
          await this.iRequerimientoListDataSource.getListRequerimientos(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getInitialRequerimiento(
      String anio) async {
    try {
      final list = await this.iRequerimientoInitialDataSource.getDataInit(anio);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> newRequerimiento(
      ParamsNewRequerimiento params) {
    // TODO: implement newRequerimiento
    throw UnimplementedError();
  }
}
