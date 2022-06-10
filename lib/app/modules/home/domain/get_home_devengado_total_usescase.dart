import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/home/domain/i_home_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class GetHomeDevengadoTotalUseCase implements UseCase<ResponseModel, NoParams> {
  final IHomeRepository iHomeRepository;

  GetHomeDevengadoTotalUseCase({required this.iHomeRepository});

  @override
  Future<Either<Failure, ResponseModel>> call(NoParams params) async {
    return await iHomeRepository.getHomeDevengadoTotal();
  }
}
