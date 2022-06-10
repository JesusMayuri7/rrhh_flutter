import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

import '../repository/i_liquidacion_repository.dart';

class GettLiquidacionResumenUseCase
    implements UseCase<ResponseEntity, ParamsLiquidacionResumen> {
  final ILiquidacionRepository repositoryLiquidacion;

  GettLiquidacionResumenUseCase({required this.repositoryLiquidacion});

  @override
  Future<Either<Failure, ResponseEntity>> call(
      ParamsLiquidacionResumen paramsResumen) async {
    return await repositoryLiquidacion
        .getListLiquidacionResumenSiaf(paramsResumen);
  }
}
