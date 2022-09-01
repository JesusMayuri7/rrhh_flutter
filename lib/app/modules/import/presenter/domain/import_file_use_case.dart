// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/import/presenter/domain/i_import_repository.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../../core/domain/use_cases/usecase.dart';
import '../../../../../../core/errors/failure.dart';

class ImportFileUseCase implements UseCase<ResponseEntity, ParamsInportFile> {
  final IImportFileRepository repository;

  ImportFileUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsInportFile params) async {
    return await repository.importFile(params);
  }
}

class ParamsInportFile {
  File? bytes;
  String? anio;
  ParamsInportFile({
    this.bytes,
    this.anio,
  });
}
