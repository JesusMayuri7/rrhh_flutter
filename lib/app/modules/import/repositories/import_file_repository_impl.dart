import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/import/data/i_import_file_datasource.dart';
import 'package:rrhh_clean/app/modules/import/presenter/domain/i_import_repository.dart';
import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class ImportFileRepositoryImpl implements IImportFileRepository {
  final IImportFileDatasource iImportFileDatasource;

  //ListarRepositoryImpl(this.datasource);
  ImportFileRepositoryImpl({required this.iImportFileDatasource});

  @override
  Future<Either<Failure, ResponseEntity>> importFile(
      ParamsInportFile params) async {
    ResponseEntity result;
    try {
      result = await this.iImportFileDatasource.importFile(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
