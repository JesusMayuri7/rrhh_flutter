import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/i_prac_repository.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class GetDataInitialPracUseCase
    implements UseCase<List<ResponseEntity>, String> {
  final IPracRepository iPracRepository;

  GetDataInitialPracUseCase({
    required this.iPracRepository,
  });

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(String anio) async {
    return await iPracRepository.getDataInitial(anio);
  }
}
