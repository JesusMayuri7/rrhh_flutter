import 'package:dartz/dartz.dart';

import '../repository/confianza_respository.dart';

import '../../../../../core/domain/entities/response_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class GetListConfianzaUseCase implements UseCase<ResponseEntity, String> {
  final IConfianzaRepository repository;

  GetListConfianzaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(String anio) async {
    return await repository.getListConfianza(anio);
  }
}
