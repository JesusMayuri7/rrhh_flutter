import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/domain/use_cases/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../repository/i_liquidacion_repository.dart';

class GetLiquidacionDataInitialUseCase
    implements UseCase<List<ResponseEntity>, String> {
  final ILiquidacionRepository repositoryLiquidacion;

  GetLiquidacionDataInitialUseCase({required this.repositoryLiquidacion});

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(String anio) async {
    return await repositoryLiquidacion.getDataInitial(anio);
  }
}
