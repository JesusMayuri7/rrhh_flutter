import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/documentos/domain/documentos_list_usecase.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'new_documentos_use_case.dart';
import 'update_documentos_use_case.dart';

abstract class IDocumentosRepository {
  Future<Either<Failure, ResponseEntity>> getListDocumentos(
      ParamsDocumentos params);
  Future<Either<Failure, ResponseEntity>> newDocumento(
      ParamsNewDocumento params);
  //Future<Either<Failure, ResponseEntity>> updateDocumento(      ParamsUpdateDocumento params);
}
