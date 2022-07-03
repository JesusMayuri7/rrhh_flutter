import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/base_cas_entity.dart';
import '../entities/calcular_cas_entity.dart';
import '../entities/presupuesto_cas_entity.dart';
import '../repositories/i_listar_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class CalcularCasUseCase implements UseCase<CalcularCasEntity, ParamsCalcular> {
  final IListarRepository repository;

  CalcularCasUseCase(this.repository);

  @override
  Future<Either<Failure, CalcularCasEntity>> call(ParamsCalcular params) async {
    List<BaseCasEntity> listCalculated = [];
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
          mesFin: params.mesFin));
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
  final double porcentajeEssalud;
  final double porcentajePrimaSctrSalud;
  final double porcentajePrimaSctrPension;
  final double porcentajeComisionSctrPension;
  final int mesInicio;
  final int mesFin;
  final List<PresupuestoCasEntity> pim;
  final List<PresupuestoCasEntity> certificado;
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
    required this.mesInicio,
    required this.mesFin,
    this.pim = const [],
    this.certificado = const [],
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
        mesInicio,
        mesFin,
        pim,
        certificado
      ];
}
