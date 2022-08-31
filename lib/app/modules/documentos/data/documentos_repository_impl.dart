import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/documentos/datasource/i_documentos_list_datasource.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import 'package:rrhh_clean/core/errors/failure.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../datasource/i_documentos_new_datasource.dart';
import '../datasource/i_documentos_update_datasource.dart';
import '../domain/documentos_list_usecase.dart';
import '../domain/i_documentos_repository.dart';
import '../domain/new_documentos_use_case.dart';
import '../domain/update_documentos_use_case.dart';

class DocumentosRepositoryImpl implements IDocumentosRepository {
  final IDocumentosListDataSource iDocumentosListDataSource;
  final IDocumentosNewDataSource iDocumentosNewDataSource;
  //final IDocumentosUpdateDataSource iDocumentosUpdateDataSource;

  DocumentosRepositoryImpl({
    required this.iDocumentosListDataSource,
    required this.iDocumentosNewDataSource,
    // required this.iDocumentosUpdateDataSource,
  });

  @override
  Future<Either<Failure, ResponseEntity>> getListDocumentos(
      ParamsDocumentos params) async {
    try {
      final list =
          await this.iDocumentosListDataSource.getListDocumentos(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

/*   @override
  Future<Either<Failure, ResponseEntity>> updateDocumento(
      ParamsUpdateDocumento params) async {
    try {
      final list =
          await this.iDocumentosUpdateDataSource.updateDocumentos(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  } */

  @override
  Future<Either<Failure, ResponseEntity>> newDocumento(
      ParamsNewDocumento params) async {
    try {
      final list = await this.iDocumentosNewDataSource.newDocumento(params);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
