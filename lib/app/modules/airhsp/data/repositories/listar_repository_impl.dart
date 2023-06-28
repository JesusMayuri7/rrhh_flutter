// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/airhsp/data/datasources/i_airhsp_presupuesto_datasource.dart';
import 'package:rrhh_clean/app/modules/airhsp/data/datasources/i_download_file_datasource.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_codigo_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/save_codigo_use_case.dart';
import 'package:rrhh_clean/core/data/datasource/i_modalidades_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/i_airhsp_respository.dart';
import '../datasources/airhsp_ext_datasource.dart';
import '../datasources/i_airhsp_codigos_datasource.dart';
import '../datasources/i_listar_presupuesto_datasource.dart';
import '../models/airhsp_model.dart';
import '../models/conceptos_model.dart';

class ListarRepositoryImpl implements IAirhspRepository {
  final IListarAirhspDatasource datasource;
  final IDownloadFileDatasource iDownloadFileDatasource;
  final IAirhspPresupuestoDatasource iAirhspPresupuestoDatasource;
  final IAirhspExtDatasource iAirhspExtDatasource;
  final IAirhspCodigoDatasource iListarCodigoDatasource;
  final IModalidadesDatasourceApp iModalidadesDatasourceApp;

  ListarRepositoryImpl({
    required this.datasource,
    required this.iDownloadFileDatasource,
    required this.iAirhspPresupuestoDatasource,
    required this.iAirhspExtDatasource,
    required this.iListarCodigoDatasource,
    required this.iModalidadesDatasourceApp,
  });

  @override
  Future<Either<Failure, List<AirHspModel>>> listar(
      ejecutora, tipoPersona) async {
    List<AirHspModel> list;
    try {
      list = await datasource.listar(ejecutora, tipoPersona);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ConceptoModel>>> conceptos(
      ejecutora, tipoPersona, codPlaza) async {
    List<ConceptoModel> list;
    try {
      list = await datasource.conceptos(ejecutora, tipoPersona, codPlaza);
      return Right(list);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> downloadFile(
      String tipoPersona) async {
    try {
      var result = await iDownloadFileDatasource.downloadFile(tipoPersona);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> listarAirshspPresupuesto(
      String anio) async {
    try {
      var result = await iAirhspPresupuestoDatasource.listar(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

    @override
  Future<Either<Failure, ResponseModel>> listarAirshspExt(
      String anio) async {
    try {
      var result = await iAirhspExtDatasource.listar(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
  
  @override
  Future<Either<Failure, ResponseModel>> listarAirshspCodigo(ParamsCodigo paramsCodigo) async {
    try {
      var result = await iListarCodigoDatasource.listar(paramsCodigo);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
  
  @override
  Future<Either<Failure, ResponseModel>> getModalidad(String anio) async {
    try {
      var result = await iModalidadesDatasourceApp.getModalidades(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> saveCodigo(ParamsAirhspCodigo paramsAirhspCodigo) {
    // TODO: implement saveCodigo
    throw UnimplementedError();
  }
}
