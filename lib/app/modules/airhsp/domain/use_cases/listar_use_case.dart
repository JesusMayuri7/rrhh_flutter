import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/airhsp_entity.dart';
import '../repositories/i_airhsp_respository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class ListarUseCase implements UseCase<List<AirhspEntity>, ParamsListar> {
  final IAirhspRepository repository;

  ListarUseCase(this.repository);

  @override
  Future<Either<Failure, List<AirhspEntity>>> call(ParamsListar params) async {
    return await repository.listar(params.ejecutora, params.tipoPersona);
  }
}

class ParamsListar extends Equatable {
  final String ejecutora;
  final String tipoPersona;
  final String? codPlaza;

  ParamsListar(
      {required this.ejecutora, required this.tipoPersona, this.codPlaza});

  @override
  List<Object> get props => [ejecutora, tipoPersona];
}
