import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/i_prac_repository.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class ListarPracUseCase implements UseCase<List<PracticanteEntity>, String> {
  final IPracRepository iPracRepository;

  ListarPracUseCase({
    required this.iPracRepository,
  });

  @override
  Future<Either<Failure, List<PracticanteEntity>>> call(String anio) async {
    // Filter Activo
    var result = await iPracRepository.listarPrac(anio);
    return result.fold(
        (l) => Left(l),
        (r) => Right(
            r.where((element) => element.presupuesto == 'ACTIVO').toList()));
  }
}
