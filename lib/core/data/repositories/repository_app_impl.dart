// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/data/datasource/i_certificados_datasource_app.dart';
import 'package:rrhh_clean/core/data/datasource/i_clasificador_datasource_app.dart';
import 'package:rrhh_clean/core/data/datasource/i_metas_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/repository/i_repository_app.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../datasource/i_areas_datasource_app.dart';

class RepositoryAppImpl implements IRepositoryApp {
  final IClasificadorDatasourceApp iDatasourceApp;
  final IMetasDatasourceApp iMetasDatasourceApp;
  final IAreasDatasourceApp iAreasDatasourceApp;
  final ICertificadosDatasourceApp iCertificadosDatasourceApp;

  RepositoryAppImpl({
    required this.iDatasourceApp,
    required this.iMetasDatasourceApp,
    required this.iAreasDatasourceApp,
    required this.iCertificadosDatasourceApp,
  });

  @override
  Future<Either<Failure, ResponseModel>> getClasificadores(String anio) async {
    try {
      final result = await this.iDatasourceApp.getClasificadores(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> getMetas(String anio) async {
    try {
      final result = await this.iMetasDatasourceApp.getMetas(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getCertificados(String anio) async {
    try {
      final result =
          await this.iCertificadosDatasourceApp.getCertificados(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getAreas() async {
    try {
      final result = await this.iAreasDatasourceApp.getAreas();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
