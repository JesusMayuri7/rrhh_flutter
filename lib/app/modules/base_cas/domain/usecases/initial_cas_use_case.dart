import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/domain/use_cases/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../repositories/i_listar_repository.dart';

class InitialCasUseCase implements UseCase<ResponseEntity, ParamsInitial> {
  final IListarRepository repository;

  InitialCasUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsInitial params) async {
    return await repository.initialBaseCas(
        dscVariable: params.dscVariable,
        modalidadId: params.modalidadId,
        anio: params.anio);
  }
}

class ParamsInitial {
  final String dscVariable;
  final int modalidadId;
  final String anio;
  ParamsInitial({
    required this.dscVariable,
    required this.modalidadId,
    required this.anio,
  });
}
