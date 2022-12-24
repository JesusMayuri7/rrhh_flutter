import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/i_requerimiento_repository.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class GetRequerimientosInitialUseCase
    implements UseCase<List<ResponseEntity>, String> {
  final IRequerimientoRepository iRequerimientoRepository;

  GetRequerimientosInitialUseCase({required this.iRequerimientoRepository});

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(String anio) async {
    return await this.iRequerimientoRepository.getInitialRequerimiento(anio);
  }
}
