import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class RequerimientoListUseCase
    extends UseCase<ResponseEntity, ParamsRequerimiento> {
  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsRequerimiento params) {
    throw UnimplementedError();
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
