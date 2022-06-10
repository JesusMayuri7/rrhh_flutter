import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/repository/i_liquidacion_repository.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class GettLiquidacionResumenesUseCase
    implements UseCase<List<ResponseEntity>, ParamsLiquidacionResumen> {
  final ILiquidacionRepository repositoryLiquidacion;

  GettLiquidacionResumenesUseCase({required this.repositoryLiquidacion});

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(
      ParamsLiquidacionResumen paramsResumen) async {
    return await repositoryLiquidacion
        .getListLiquidacionResumenes(paramsResumen);
  }
}
