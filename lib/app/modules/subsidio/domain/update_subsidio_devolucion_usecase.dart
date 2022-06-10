import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/i_subsidio_repository.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class UpdateSubsidioDevolucionUseCase
    implements UseCase<SubsidioDevolucionEntity, ParamsUpdateSubsidio> {
  final ISubsidioRepository subsidioRepository;

  UpdateSubsidioDevolucionUseCase({required this.subsidioRepository});

  @override
  Future<Either<Failure, SubsidioDevolucionEntity>> call(
      ParamsUpdateSubsidio paramsUpdateLiquidacion) async {
    return await subsidioRepository.updateSubsidioDevolucion(
        ParamsUpdateSubsidio(
            subsidioDevolucionId: paramsUpdateLiquidacion.subsidioDevolucionId,
            campo: paramsUpdateLiquidacion.campo,
            valor: paramsUpdateLiquidacion.valor));
  }
}

class ParamsUpdateSubsidio {
  final int subsidioDevolucionId;
  final String campo;
  final dynamic valor;
  ParamsUpdateSubsidio(
      {required this.subsidioDevolucionId,
      required this.campo,
      required this.valor});
}
