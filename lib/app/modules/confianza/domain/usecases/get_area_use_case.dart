import 'package:dartz/dartz.dart';

import '../repository/confianza_respository.dart';
import '../../../../../core/domain/entities/response_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class GetListAreaUseCase implements UseCase<ResponseEntity, NoParams> {
  final IConfianzaRepository confianzaRepository;

  GetListAreaUseCase({
    required this.confianzaRepository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(NoParams params) async {
    return await confianzaRepository.getListAreas();
  }
}
