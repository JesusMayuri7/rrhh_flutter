import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/i_subsidio_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class GetSubsidioDevolucionDataInitialUseCase
    implements UseCase<List<ResponseModel>, String> {
  final ISubsidioRepository subsidioRepository;
  GetSubsidioDevolucionDataInitialUseCase({
    required this.subsidioRepository,
  });

  @override
  Future<Either<Failure, List<ResponseModel>>> call(String anio) async {
    return await subsidioRepository.getDataInitial(anio);
  }
}
