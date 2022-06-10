import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

import '../repository/i_liquidacion_repository.dart';

class UpdateLiquidacionDetalleUseCase
    implements UseCase<Map<String, dynamic>, ParamsUpdateLiquidacionDetalle> {
  final ILiquidacionRepository repositoryLiquidacion;

  UpdateLiquidacionDetalleUseCase({required this.repositoryLiquidacion});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      ParamsUpdateLiquidacionDetalle paramsUpdateLiquidacionDetalle) async {
    return await repositoryLiquidacion.updateLiquidacionDetalle(
        ParamsUpdateLiquidacionDetalle(
            liquidacionDetalle:
                paramsUpdateLiquidacionDetalle.liquidacionDetalle,
            liquidacionDetalleId:
                paramsUpdateLiquidacionDetalle.liquidacionDetalleId,
            dscMonto: paramsUpdateLiquidacionDetalle.dscMonto,
            monto: paramsUpdateLiquidacionDetalle.monto));
  }
}

class ParamsUpdateLiquidacionDetalle {
  final List<LiquidacionDetalleEntity> liquidacionDetalle;
  final int liquidacionDetalleId;
  final String dscMonto;
  final double monto;
  ParamsUpdateLiquidacionDetalle(
      {required this.liquidacionDetalle,
      required this.liquidacionDetalleId,
      required this.dscMonto,
      required this.monto});
}
