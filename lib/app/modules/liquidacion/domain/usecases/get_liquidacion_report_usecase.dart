import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/repository/i_liquidacion_repository.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class GetLiquidacionReportUseCase implements UseCase<ResponseEntity, String> {
  final ILiquidacionRepository repositoryLiquidacion;

  GetLiquidacionReportUseCase({
    required this.repositoryLiquidacion,
  });
  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await repositoryLiquidacion.getLiquidacionReport(anio);
  }
}
