import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/i_prac_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class AltaBajaPracUseCase implements UseCase<ResponseModel, ParamsAltaBaja> {
  final IPracRepository iPracRepository;

  AltaBajaPracUseCase({
    required this.iPracRepository,
  });

  @override
  Future<Either<Failure, ResponseModel>> call(ParamsAltaBaja params) async {
    return await iPracRepository.altaBajaPrac(params);
  }
}

class ParamsAltaBaja {
  int id;
  int anio;
  String fechaBaja;
  String fechaAlta;
  String codigoBaja;
  String codigoAlta;
  ParamsAltaBaja({
    required this.id,
    required this.anio,
    required this.fechaBaja,
    required this.fechaAlta,
    required this.codigoBaja,
    required this.codigoAlta,
  });

  @override
  String toString() {
    return 'ParamsAltaBaja(id: $id, anio: $anio, fechaBaja: $fechaBaja, fechaAlta: $fechaAlta, codigoBaja: $codigoBaja, codigoAlta: $codigoAlta)';
  }

  Map<String, dynamic> toMap() {
    return {
      'anio': anio,
      'fechaBaja': fechaBaja,
      'fechaAlta': fechaAlta,
      'codigoBaja': codigoBaja,
      'codigoAlta': codigoAlta,
    };
  }

  factory ParamsAltaBaja.fromMap(Map<String, dynamic> map) {
    return ParamsAltaBaja(
      id: map['id'],
      anio: map['anio'],
      fechaBaja: map['fechaBaja'],
      fechaAlta: map['fechaAlta'],
      codigoBaja: map['codigoBaja'],
      codigoAlta: map['codigoAlta'],
    );
  }
}
