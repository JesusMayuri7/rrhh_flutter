import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/airhsp_entity.dart';
import '../entities/concepto_entity.dart';

abstract class IAirhspRepository {
  Future<Either<Failure, List<AirhspEntity>>> listar(
      String ejecutora, String tipoPersona);

  Future<Either<Failure, List<ConceptoEntity>>> conceptos(
      String ejecutora, String tipoPersona, String codPlaza);
}
