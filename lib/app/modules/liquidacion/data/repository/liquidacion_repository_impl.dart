import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_add_liquidacion_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_data_initial_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_report_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_resumen_siaf_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_resumenes_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_update_liquidacion_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/add_liquidacion_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/update_liquidacion_usecase.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';

import '../../domain/repository/i_liquidacion_repository.dart';

import '../../domain/usecases/update_liquidacion_detalle.dart';
import '../datasource/i_get_liquidacion_datasource.dart';

import '../datasource/i_update_liquidacion_detalle_datasource.dart';

class LiquidacionRepositoryImpl implements ILiquidacionRepository {
  final IGetLiquidacionCasDatasource getLiquidacionCasDatasource;
  final IGetLiquidacionResumenSiafDatasource
      getLiquidacionResumenSiafDatasource;
  final IGetLiquidacionResumenesDatasource getLiquidacionResumenesDatasource;
  final IUpdateLiquidacionDetalleDatasource updateLiquidacionDetalleDatasource;
  final IUpdateLiquidacionDatasource updateLiquidacionDatasource;
  final IAddLiquidacionDatasource addLiquidacionDatasource;
  final IGetDataInitialDatasource getDataInitialDatasourceImpl;
  final IGetLiquidacionReportDatasource getLiquidacionReportDatasource;

  LiquidacionRepositoryImpl({
    required this.getLiquidacionResumenesDatasource,
    required this.getLiquidacionCasDatasource,
    required this.getLiquidacionResumenSiafDatasource,
    required this.updateLiquidacionDetalleDatasource,
    required this.updateLiquidacionDatasource,
    required this.addLiquidacionDatasource,
    required this.getDataInitialDatasourceImpl,
    required this.getLiquidacionReportDatasource,
  });
  @override
  Future<Either<Failure, ResponseEntity>> getListLiquidacion(
      String anio) async {
    try {
      final result =
          await this.getLiquidacionCasDatasource.getListLiquidacionCas(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getListLiquidacionResumenSiaf(
      ParamsLiquidacionResumen paramsResumen) async {
    try {
      final result = await this
          .getLiquidacionResumenSiafDatasource
          .getListLiquidacionResumenSiaf(paramsResumen);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateLiquidacionDetalle(
      ParamsUpdateLiquidacionDetalle paramsUupdate) async {
    try {
      final result = await this
          .updateLiquidacionDetalleDatasource
          .upddateLiquidacionDetalle(paramsUupdate);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> addLiquidacion(
      ParamsAddLiquidacion params) async {
    try {
      final result = await this.addLiquidacionDatasource.addLiquidacion(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getDataInitial(
      String anio) async {
    try {
      final result =
          await this.getDataInitialDatasourceImpl.getDataInitial(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateLiquidacion(
      ParamsUpdateLiquidacion paramsUupdate) async {
    try {
      final result = await this
          .updateLiquidacionDatasource
          .upddateLiquidacion(paramsUupdate);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getLiquidacionReport(
      String anio) async {
    try {
      final result =
          await this.getLiquidacionReportDatasource.getLiquidacionReport(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getListLiquidacionResumenes(
      ParamsLiquidacionResumen paramsResumen) async {
    try {
      final result = await this
          .getLiquidacionResumenesDatasource
          .getListLiquidacionResumenes(paramsResumen);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
