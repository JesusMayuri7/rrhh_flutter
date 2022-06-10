import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/home/domain/cap_estado_opp_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class SumCapEstadoOppUseCase
    implements UseCase<List<CapEstadoOppEntity>, List<CapEstadoOppEntity>> {
  SumCapEstadoOppUseCase();

  @override
  Future<Either<Failure, List<CapEstadoOppEntity>>> call(
      List<CapEstadoOppEntity> params) async {
    int ocupado = 0;
    int vacante = 0;
    int reservado = 0;

    for (var item in params) {
      ocupado += item.ocupado;
      vacante += item.vacante;
      reservado += item.reservado;
    }
    params.add(CapEstadoOppEntity(
        descUnidad: '',
        modalidad: '',
        ocupado: ocupado,
        vacante: vacante,
        reservado: reservado,
        orgUId: 0));

    return Future.value(Right(params));
  }
}
