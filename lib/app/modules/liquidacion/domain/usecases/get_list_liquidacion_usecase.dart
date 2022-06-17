import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

import '../repository/i_liquidacion_repository.dart';

class GetListLiquidacionUseCase implements UseCase<ResponseEntity, String> {
  final ILiquidacionRepository repositoryLiquidacion;

  GetListLiquidacionUseCase({required this.repositoryLiquidacion});

  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await repositoryLiquidacion.getListLiquidacion(anio);
  }
}
