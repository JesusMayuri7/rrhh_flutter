import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_requerimiento_repository.dart';

class RequerimientoListUseCase
    extends UseCase<ResponseEntity, ParamsRequerimiento> {
  final IRequerimientoRepository iRequerimientoRepository;

  RequerimientoListUseCase({required this.iRequerimientoRepository});

  @override
  Future<Either<Failure, ResponseEntity>> call(
      ParamsRequerimiento params) async {
    return await iRequerimientoRepository.getListRequerimiento(params);
  }
}

class ParamsRequerimiento {
  final String anio;
  final String dscModalidad;
  ParamsRequerimiento({
    required this.anio,
    required this.dscModalidad,
  });
}
