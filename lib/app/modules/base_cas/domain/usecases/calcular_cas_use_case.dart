// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/domain/use_cases/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/base_cas_entity.dart';
import '../entities/calcular_cas_entity.dart';
import '../entities/presupuesto_cas_entity.dart';
import '../repositories/i_listar_repository.dart';

class CalcularCasUseCase implements UseCase<CalcularCasEntity, ParamsCalcular> {
  final IListarRepository repository;

  CalcularCasUseCase(this.repository);

  @override
  Future<Either<Failure, CalcularCasEntity>> call(ParamsCalcular params) async {
    List<BaseCasEntity> listCalculated = [];
    params.copyWith(calcularMesesIniciales: false);
    params.lista.forEach((e) {
      listCalculated.add(e.calcular(
        uit: params.uit,
        porcentajeMaximoEssalud: params.porcentajeMaximoEssalud,
        aguinaldoSemestral: params.aguinaldoSemestral,
        porcentajeIgv: params.porcentajeIgv,
        porcentajeEssalud: params.porcentajeEssalud,
        porcentajePrimaSctrSalud: params.porcentajePrimaSctrSalud,
        porcentajePrimaSctrPension: params.porcentajePrimaSctrPension,
        porcentajeComisionSctrPension: params.porcentajeComisionSctrPension,
        mesInicio: params.mesInicio,
        mesFin: params.mesFin,
      ));
    });

    CalcularCasEntity result = CalcularCasEntity(
      listaBaseCas: listCalculated,
    );
    return Future.value(Right(result));
  }
}

class ParamsCalcular extends Equatable {
  final List<BaseCasEntity> lista;
  final double uit;
  final double porcentajeMaximoEssalud;
  final double aguinaldoSemestral;
  final double porcentajeIgv;
  final num incrementoCas;
  final double porcentajeEssalud;
  final double porcentajePrimaSctrSalud;
  final double porcentajePrimaSctrPension;
  final double porcentajeComisionSctrPension;
  final int mesInicio;
  final int mesFin;
  final List<PresupuestoCasEntity> pim;
  final List<PresupuestoCasEntity> certificado;
  final bool calcularMesesIniciales;
  ParamsCalcular({
    required this.lista,
    required this.uit,
    required this.porcentajeMaximoEssalud,
    required this.aguinaldoSemestral,
    required this.porcentajeEssalud,
    required this.porcentajePrimaSctrSalud,
    required this.porcentajePrimaSctrPension,
    required this.porcentajeComisionSctrPension,
    required this.porcentajeIgv,
    required this.incrementoCas,
    required this.mesInicio,
    required this.mesFin,
    this.pim = const [],
    this.certificado = const [],
    this.calcularMesesIniciales = true,
  });

  @override
  List<Object?> get props => [
        lista,
        uit,
        porcentajeMaximoEssalud,
        aguinaldoSemestral,
        porcentajeEssalud,
        porcentajePrimaSctrSalud,
        porcentajePrimaSctrPension,
        porcentajeComisionSctrPension,
        porcentajeIgv,
        incrementoCas,
        mesInicio,
        mesFin,
        pim,
        certificado,
        calcularMesesIniciales
      ];

  ParamsCalcular copyWith({
    List<BaseCasEntity>? lista,
    double? uit,
    double? porcentajeMaximoEssalud,
    double? aguinaldoSemestral,
    double? porcentajeIgv,
    num? incrementoCas,
    double? porcentajeEssalud,
    double? porcentajePrimaSctrSalud,
    double? porcentajePrimaSctrPension,
    double? porcentajeComisionSctrPension,
    int? mesInicio,
    int? mesFin,
    List<PresupuestoCasEntity>? pim,
    List<PresupuestoCasEntity>? certificado,
    bool? calcularMesesIniciales,
  }) {
    return ParamsCalcular(
      lista: lista ?? this.lista,
      uit: uit ?? this.uit,
      porcentajeMaximoEssalud:
          porcentajeMaximoEssalud ?? this.porcentajeMaximoEssalud,
      aguinaldoSemestral: aguinaldoSemestral ?? this.aguinaldoSemestral,
      porcentajeIgv: porcentajeIgv ?? this.porcentajeIgv,
      incrementoCas: incrementoCas ?? this.incrementoCas,
      porcentajeEssalud: porcentajeEssalud ?? this.porcentajeEssalud,
      porcentajePrimaSctrSalud:
          porcentajePrimaSctrSalud ?? this.porcentajePrimaSctrSalud,
      porcentajePrimaSctrPension:
          porcentajePrimaSctrPension ?? this.porcentajePrimaSctrPension,
      porcentajeComisionSctrPension:
          porcentajeComisionSctrPension ?? this.porcentajeComisionSctrPension,
      mesInicio: mesInicio ?? this.mesInicio,
      mesFin: mesFin ?? this.mesFin,
      pim: pim ?? this.pim,
      certificado: certificado ?? this.certificado,
      calcularMesesIniciales:
          calcularMesesIniciales ?? this.calcularMesesIniciales,
    );
  }
}
