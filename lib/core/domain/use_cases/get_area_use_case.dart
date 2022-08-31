import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/response_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';
import '../repository/i_repository_app.dart';

class GetListAreaUseCase implements UseCase<ResponseEntity, NoParams> {
  final IRepositoryApp repositoryApp;

  GetListAreaUseCase({
    required this.repositoryApp,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(NoParams params) async {
    return await repositoryApp.getAreas();
  }
}
