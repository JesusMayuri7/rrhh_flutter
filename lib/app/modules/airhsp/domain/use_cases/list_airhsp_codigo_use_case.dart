// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/repositories/i_airhsp_respository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class ListarAirhspCodigoUseCase implements UseCase<ResponseModel, ParamsCodigo> {
  final IAirhspRepository repository;

  ListarAirhspCodigoUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseModel>> call(ParamsCodigo paramsCodigo) async {
    return await repository.listarAirshspCodigo(paramsCodigo);
  }
}

class ParamsCodigo {
  final int tipoPersona;
  final String anio;
  ParamsCodigo({
    required this.tipoPersona,
    required this.anio,
  });
}
