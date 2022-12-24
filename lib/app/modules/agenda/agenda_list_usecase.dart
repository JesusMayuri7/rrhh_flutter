// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/agenda/agenda_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class AgendaListUseCase extends UseCase<ResponseModel, String> {
  final IAgendaRepository iAgendaRepository;
  AgendaListUseCase({
    required this.iAgendaRepository,
  });

  @override
  Future<Either<Failure, ResponseModel>> call(params) async {
    return await this.iAgendaRepository.listarAgenda();
  }
}
