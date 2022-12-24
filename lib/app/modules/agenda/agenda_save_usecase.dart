// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/agenda/agenda_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'cubit/agenda_params.dart';

class AgendaSaveUseCase extends UseCase<ResponseModel, AgendaParams> {
  final IAgendaRepository iAgendaRepository;

  AgendaSaveUseCase({
    required this.iAgendaRepository,
  });

  @override
  Future<Either<Failure, ResponseModel>> call(AgendaParams params) async {
    print('save usecase');
    return await this.iAgendaRepository.saveAgenda(params);
  }
}
