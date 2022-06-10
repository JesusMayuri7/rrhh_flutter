import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

import '../repository/i_liquidacion_repository.dart';

class UpdateLiquidacionUseCase
    implements UseCase<Map<String, dynamic>, ParamsUpdateLiquidacion> {
  final ILiquidacionRepository repositoryLiquidacion;

  UpdateLiquidacionUseCase({required this.repositoryLiquidacion});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      ParamsUpdateLiquidacion paramsUpdateLiquidacion) async {
    return await repositoryLiquidacion.updateLiquidacion(
        ParamsUpdateLiquidacion(
            liquidacionId: paramsUpdateLiquidacion.liquidacionId,
            campo: paramsUpdateLiquidacion.campo,
            valor: paramsUpdateLiquidacion.valor));
  }
}

class ParamsUpdateLiquidacion {
  final int liquidacionId;
  final String campo;
  final dynamic valor;
  ParamsUpdateLiquidacion(
      {required this.liquidacionId, required this.campo, required this.valor});
}
