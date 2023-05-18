// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/core/domain/entities/presupuesto_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'certificado_prac_use_case.dart';
import 'generate_excel_prac.dart';

class ExportPracUseCase implements UseCase<bool, ParamsPracCalcular> {
  //final PresupuestalPracUseCase presupuestalPracUseCase;
  final CertificadoPracUseCase certificadoPracUseCase;
  ExportPracUseCase({
    required this.certificadoPracUseCase,
  });

  @override
  Future<Either<Failure, bool>> call(ParamsPracCalcular params) async {

    List<PresupuestoEntity> pimCas = [];
    List<PresupuestoEntity> certificadoPrac = [];
    
      var resultPresupuestoCas = await certificadoPracUseCase(params.anio);
      resultPresupuestoCas.fold((l) {
        return Error(l.toString());
      }, (r) {
        //pimCas = [];
        certificadoPrac = List<PresupuestoEntity>.from(r.data);        
        params.copyWith(certificado: certificadoPrac);
      });
   
    try {
      generateExcelPrac(params);
      return Right(true);
    } catch (e) {
      throw Error(e.toString());
    }
  }
}

class ParamsPracCalcular extends Equatable {
  final String anio;
  final List<PracticanteEntity> lista;
  final double porcentajeIgv;
  final double porcentajePrimaSctrPension;
  final double porcentajeComisionSctrPension;
  final int mesInicio;
  final int mesFin;
  final List<PresupuestoEntity> pim;
  final List<PresupuestoEntity> certificado;
  ParamsPracCalcular({
    required this.anio,
    required this.lista,
    required this.porcentajeIgv,
    required this.porcentajePrimaSctrPension,
    required this.porcentajeComisionSctrPension,
    required this.mesInicio,
    required this.mesFin,
    this.pim = const [],
    this.certificado = const [],
  });

  @override
  List<Object> get props {
    return [
      anio,
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

  ParamsPracCalcular copyWith({
    String? anio,
    List<PracticanteEntity>? lista,
    double? porcentajeIgv,
    double? porcentajePrimaSctrPension,
    double? porcentajeComisionSctrPension,
    int? mesInicio,
    int? mesFin,
    List<PresupuestoEntity>? pim,
    List<PresupuestoEntity>? certificado,
  }) {
    return ParamsPracCalcular(
      anio: anio ?? this.anio,
      lista: lista ?? this.lista,
      porcentajeIgv: porcentajeIgv ?? this.porcentajeIgv,
      porcentajePrimaSctrPension: porcentajePrimaSctrPension ?? this.porcentajePrimaSctrPension,
      porcentajeComisionSctrPension: porcentajeComisionSctrPension ?? this.porcentajeComisionSctrPension,
      mesInicio: mesInicio ?? this.mesInicio,
      mesFin: mesFin ?? this.mesFin,
      pim: pim ?? this.pim,
      certificado: certificado ?? this.certificado,
    );
  }
}
