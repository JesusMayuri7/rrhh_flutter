import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_reporst_airhsp_repository.dart';

class GetReportsAirshpDownloadUseCase implements UseCase<dynamic, NoParams> {
  final IReportsAirhspRepository iReportsAirhspRepository;
  GetReportsAirshpDownloadUseCase({
    required this.iReportsAirhspRepository,
  });

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await iReportsAirhspRepository.getDownloadAirhsp();
  }
}
