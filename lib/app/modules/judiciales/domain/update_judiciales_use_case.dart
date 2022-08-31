import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_judiciales_repository.dart';
import 'new_judiciales_use_case.dart';

class UpdateJudicialUseCase
    implements UseCase<ResponseEntity, ParamsNewJudicial> {
  final IJudicialesRepository iJudicialesRepository;

  UpdateJudicialUseCase({
    required this.iJudicialesRepository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsNewJudicial params) async {
    return await this.iJudicialesRepository.newJudicial(params);
  }
}

class ParamsUpdateJudicial {
  int id;
  int anio;
  String fechaBaja;
  String fechaAlta;
  String codigoBaja;
  String codigoAlta;
  ParamsUpdateJudicial({
    required this.id,
    required this.anio,
    required this.fechaBaja,
    required this.fechaAlta,
    required this.codigoBaja,
    required this.codigoAlta,
  });

  Map<String, dynamic> toMap() {
    return {
      'anio': anio,
      'fechaBaja': fechaBaja,
      'fechaAlta': fechaAlta,
      'codigoBaja': codigoBaja,
      'codigoAlta': codigoAlta,
    };
  }

  factory ParamsUpdateJudicial.fromMap(Map<String, dynamic> map) {
    return ParamsUpdateJudicial(
      id: map['id'],
      anio: map['anio'],
      fechaBaja: map['fechaBaja'],
      fechaAlta: map['fechaAlta'],
      codigoBaja: map['codigoBaja'],
      codigoAlta: map['codigoAlta'],
    );
  }
}
