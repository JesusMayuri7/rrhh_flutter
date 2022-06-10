import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';
import '../entities/concepto_entity.dart';
import '../repositories/i_airhsp_respository.dart';

class ConceptosUseCase
    implements UseCase<List<ConceptoEntity>, ParamsConceptos> {
  final IAirhspRepository repository;

  ConceptosUseCase(this.repository);

  @override
  Future<Either<Failure, List<ConceptoEntity>>> call(
      ParamsConceptos params) async {
    return await repository.conceptos(
        params.ejecutora, params.tipoPersona, params.codPlaza ?? '000000');
  }
}

class ParamsConceptos extends Equatable {
  final String ejecutora;
  final String tipoPersona;
  final String? codPlaza;

  ParamsConceptos(
      {required this.ejecutora, required this.tipoPersona, this.codPlaza});

  @override
  List<Object> get props => [ejecutora, tipoPersona];
}
