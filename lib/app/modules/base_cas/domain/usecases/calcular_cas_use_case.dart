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
    double montoAnual = 0;
    double essaludAnual = 0;
    double sctrSaludAnual = 0;
    double sctrPensionAnual = 0;

    double totalMontoAnual = 0;
    double totalAnual = 0;

    double totalEssaludAnual = 0;
    double aguinaldoPrimerSemestre = 0;
    double aguinaldoSegundoSemestre = 0;
    double aguinaldoAnual = 0;

    double totalAguinaldoAnual = 0;

    double totalSctrSaludAnual = 0;
    double totalSctrPensionAnual = 0;
    double totalMontoEssaludAguinaldo = 0;
    //double totalAguinaldoAnual = 0;
    int mesInicio = params.mesInicio + 1;
    int mesFin = params.mesFin + 1;
    int meses = (mesFin - mesInicio) + 1;

    //Determinar meses
    //print(mesInicio.toString() + ' - ' + mesFin.toString());
    if (mesFin >= 6) {
      if (mesInicio < 5) aguinaldoPrimerSemestre = params.aguinaldoSemestral;
      if (mesInicio == 5)
        aguinaldoPrimerSemestre = params.aguinaldoSemestral - 100;
      if (mesInicio == 6)
        aguinaldoPrimerSemestre = params.aguinaldoSemestral - 200;
      if (mesFin >= 11) {
        if (mesInicio < 10)
          aguinaldoSegundoSemestre = params.aguinaldoSemestral;
        if (mesInicio == 10)
          aguinaldoSegundoSemestre = params.aguinaldoSemestral - 100;
        if (mesInicio == 11)
          aguinaldoSegundoSemestre = params.aguinaldoSemestral - 200;
      }
    }
    aguinaldoAnual = aguinaldoPrimerSemestre + aguinaldoSegundoSemestre;

    params.lista.removeLast();

    List<BaseCasEntity> listCalculated = [];

    params.lista.map((e) {
      double totalEssalud = 0;
      double totalSctrSalud = 0;
      double totalSctrPension = 0;
      double totalMonto = 0;
      double essalud = double.parse(
          (e.monto >= (params.uit * (params.porcentajeMaximoEssalud / 100))
                  ? (params.uit *
                      (params.porcentajeMaximoEssalud / 100) *
                      (params.porcentajeEssalud / 100))
                  : (e.monto * (params.porcentajeEssalud / 100)))
              .toStringAsFixed(2));
      double sctrSalud = (params.porcentajePrimaSctrSalud / 100) *
          ((params.porcentajeIgv / 100) + 1) *
          e.monto;

      double sctrPension = double.parse(
          ((params.porcentajePrimaSctrPension / 100) *
                  ((params.porcentajeIgv / 100) + 1) *
                  ((params.porcentajeComisionSctrPension / 100) + 1) *
                  e.monto)
              .toStringAsFixed(2));

      essaludAnual += essalud;

      // Campo Essalud Anual
      totalEssalud = essalud * meses;

      // Totalizado Essalud
      totalEssaludAnual += totalEssalud;

      // Campo total del monto mensual
      montoAnual += e.monto;

      // Campo total anual monto
      totalMonto = e.monto * meses;
      // Totalizado monto anual
      totalMontoAnual += totalMonto;

      totalAguinaldoAnual += aguinaldoAnual;

      totalMontoEssaludAguinaldo = totalMonto + totalEssalud + aguinaldoAnual;
      totalAnual += totalMontoEssaludAguinaldo;

      sctrSaludAnual += sctrSalud;

      totalSctrSalud = (sctrSalud * meses) +
          ((params.porcentajePrimaSctrSalud / 100) *
              ((params.porcentajeIgv / 100) + 1) *
              (aguinaldoAnual));

      totalSctrSaludAnual += totalSctrSalud;

      sctrPensionAnual += sctrPension;

      totalSctrPension = double.parse(((sctrPension * meses) +
              ((params.porcentajePrimaSctrPension / 100) *
                  ((params.porcentajeIgv / 100) + 1) *
                  ((params.porcentajeComisionSctrPension / 100) + 1) *
                  (aguinaldoAnual)))
          .toStringAsFixed(2));

      totalSctrPensionAnual += totalSctrPension;

      listCalculated.add(BaseCasEntity(
        cargo: e.cargo,
        codigoPlaza: e.codigoPlaza,
        descArea: e.descArea,
        detalle: e.detalle,
        dni: e.dni,
        estadoActual: e.estadoActual,
        estadoAir: e.estadoAir,
        estadoConvocatoria: e.estadoConvocatoria,
        fechaAlta: e.fechaAlta,
        fechaBaja: e.fechaBaja,
        fuenteBase: e.fuenteBase,
        meta2020: e.meta2020,
        meta: e.meta,
        modalidad: e.modalidad,
        monto: e.monto,
        nombres: e.nombres,
        nroConvocatoria: e.nroConvocatoria,
        presupuesto: e.presupuesto,
        producto: e.producto,
        resultadoConvocatoria: e.resultadoConvocatoria,
        sede: e.sede,
        sustentoLegal: e.sustentoLegal,
        vigencia: e.vigencia,
        uit: e.uit,
        mesInicio: mesInicio,
        mesFin: mesFin,
        montoAnual: totalMonto,
        essalud: essalud,
        essaludAnual: double.parse((totalEssalud).toStringAsFixed(2)),
        aguinaldoAnual: aguinaldoAnual,
        total: totalMontoEssaludAguinaldo,
        sctrSalud: sctrSalud,
        sctrSaludAnual: totalSctrSalud,
        sctrPension: sctrPension,
        sctrPensionAnual: totalSctrPension,
      ));
    }).toList();
    listCalculated.add(BaseCasEntity(
      codigoPlaza: '# ${params.lista.length}',
      presupuesto: '',
      producto: '',
      descArea: '',
      sede: '',
      fuenteBase: '',
      meta: '',
      meta2020: '',
      cargo: '',
      dni: '',
      nombres: '',
      modalidad: '',
      vigencia: '',
      estadoActual: '',
      estadoAir: '',
      sustentoLegal: '',
      nroConvocatoria: '',
      estadoConvocatoria: '',
      resultadoConvocatoria: '',
      fechaAlta: '',
      fechaBaja: '',
      monto: montoAnual,
      essalud: essaludAnual,
      montoAnual: totalMontoAnual,
      essaludAnual: totalEssaludAnual,
      aguinaldoAnual: totalAguinaldoAnual,
      total: totalAnual,
      sctrSalud: sctrSaludAnual,
      sctrSaludAnual: totalSctrSaludAnual,
      sctrPension: sctrPensionAnual,
      sctrPensionAnual: totalSctrPensionAnual,
      detalle: '',
    ));

    CalcularCasEntity result = CalcularCasEntity(
      listaBaseCas: listCalculated,
      /*  totalMonto: totalMonto,
        totalEssalud: totalEssalud,
        totalMontoAnual: totalMontoAnual,
        totalEssaludAnual: totalEssaludAnual,
        totalAguinaldoAnual: totalAguinaldoAnual,
        totalAnual: totalAnual,
        totalSctrAnual: totalSctrAnual*/
    );
    return Future.value(Right(result));

    //return await repository.listarBaseCas();
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
