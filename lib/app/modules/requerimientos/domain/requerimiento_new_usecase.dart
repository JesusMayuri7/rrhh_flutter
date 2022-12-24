// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_requerimiento_repository.dart';

class RequerimientoNewUseCase
    extends UseCase<ResponseEntity, ParamsNewRequerimiento> {
  final IRequerimientoRepository iRequerimientoRepository;

  RequerimientoNewUseCase({required this.iRequerimientoRepository});

  @override
  Future<Either<Failure, ResponseEntity>> call(
      ParamsNewRequerimiento params) async {
    return await iRequerimientoRepository.newRequerimiento(params);
  }
}

class ParamsNewRequerimiento {
  final String anio;
  final String dscModalidad;
  final RequerimientoEntity requerimientoEntity;

  ParamsNewRequerimiento({
    required this.anio,
    required this.dscModalidad,
    required this.requerimientoEntity,
  });
}
