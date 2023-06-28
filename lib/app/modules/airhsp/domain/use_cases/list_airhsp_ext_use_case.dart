import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/repositories/i_airhsp_respository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class ListarAirhspExUseCase implements UseCase<ResponseModel, String> {
  final IAirhspRepository repository;

  ListarAirhspExUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseModel>> call(String anio) async {
    return await repository.listarAirshspExt(anio);
  }
}