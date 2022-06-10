import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../repositories/i_base_cap_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class GetListBaseCapUseCase implements UseCase<ResponseEntity, String> {
  final IBaseCapRepository iBaseCapRepository;
  GetListBaseCapUseCase({
    required this.iBaseCapRepository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await iBaseCapRepository.getListBaseCap(anio);
  }
}
