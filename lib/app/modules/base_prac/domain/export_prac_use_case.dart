// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/core/domain/entities/presupuesto_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'generate_excel_prac.dart';

class ExportPracUseCase implements UseCase<bool, ParamsPracCalcular> {
  @override
  Future<Either<Failure, bool>> call(ParamsPracCalcular params) async {
    try {
      generateExcelPrac(params);
      return Right(true);
    } catch (e) {
      throw Error(e.toString());
    }
  }
}

class ParamsPracCalcular extends Equatable {
  final List<PracticanteEntity> lista;
  final double porcentajeIgv;
  final double porcentajePrimaSctrPension;
  final double porcentajeComisionSctrPension;
  final int mesInicio;
  final int mesFin;
  final List<PresupuestoEntity> pim;
  final List<PresupuestoEntity> certificado;
  ParamsPracCalcular({
    required this.lista,
    required this.porcentajePrimaSctrPension,
    required this.porcentajeComisionSctrPension,
    required this.porcentajeIgv,
    required this.mesInicio,
    required this.mesFin,
    this.pim = const [],
    this.certificado = const [],
  });

  @override
  List<Object> get props {
    return [
      lista,
      porcentajeIgv,
      porcentajePrimaSctrPension,
      porcentajeComisionSctrPension,
      mesInicio,
      mesFin,
      pim,
      certificado,
    ];
  }
}
