import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../entities/airhsp_entity.dart';
import '../entities/concepto_entity.dart';
import '../use_cases/list_airhsp_codigo_use_case.dart';
import '../use_cases/save_codigo_use_case.dart';

abstract class IAirhspRepository {
  Future<Either<Failure, List<AirhspEntity>>> listar(
      String ejecutora, String tipoPersona);
  Future<Either<Failure, ResponseModel>> listarAirshspPresupuesto(String anio);
  Future<Either<Failure, ResponseModel>> listarAirshspExt(String anio);
  Future<Either<Failure, List<ConceptoEntity>>> conceptos(
      String ejecutora, String tipoPersona, String codPlaza);
  Future<Either<Failure, ResponseModel>> downloadFile(String tipoPersona);

  Future<Either<Failure, ResponseModel>> listarAirshspCodigo(ParamsCodigo paramsCodigo);
  Future<Either<Failure, ResponseModel>> getModalidad(String anio);
  Future<Either<Failure, ResponseModel>> saveCodigo(ParamsAirhspCodigo paramsAirhspCodigo);
}
