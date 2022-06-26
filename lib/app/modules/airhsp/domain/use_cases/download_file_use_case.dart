import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/airhsp/domain/repositories/i_airhsp_respository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class DownloadFileUseCase implements UseCase<ResponseModel, String> {
  final IAirhspRepository repository;
  DownloadFileUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, ResponseModel>> call(String tipoPersona) async {
    return await repository.downloadFile(tipoPersona);
  }
}
