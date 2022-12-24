import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/base_cas_entity.dart';
import '../entities/presupuesto_cas_entity.dart';
import '../entities/resumen_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class ResumenCasUseCase implements UseCase<List<ResumenEntity>, ParamsResumen> {
  @override
  Future<Either<Failure, List<ResumenEntity>>> call(
      ParamsResumen params) async {
    double montoRoAcSueldo = 0;
    double montoRoAcEssalud = 0;
    double montoRoAcAguinaldo = 0;
    int cantidadRoAc = 0;

    double montoRoCnSueldo = 0;
    double montoRoCnEssalud = 0;
    double montoRoCnAguinaldo = 0;
    int cantidadRoCn = 0;

    double montoRdrAcSueldo = 0;
    double montoRdrAcEssalud = 0;
    double montoRdrAcAguinaldo = 0;
    int cantidadRdrAc = 0;

    double montoRdrCnSueldo = 0;
    double montoRdrCnEssalud = 0;
    double montoRdrCnAguinaldo = 0;
    int cantidadRdrCn = 0;

    if (params.baseCasList.length > 580) params.baseCasList.removeLast();

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'OCUPADO') &&
          (e.fuenteBase == 'RO') &&
          (e.producto == '3000001. ACCIONES COMUNES')) {
        montoRoAcEssalud += e.essaludAnual;
        montoRoAcSueldo += e.montoAnual;
        montoRoAcAguinaldo += e.aguinaldoAnual;
        cantidadRoAc += 1;
      }
    }).toList();

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'OCUPADO') &&
          (e.fuenteBase == 'RO') &&
          (e.producto == '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL')) {
        montoRoCnSueldo += e.montoAnual;
        montoRoCnEssalud += e.essaludAnual;
        montoRoCnAguinaldo += e.aguinaldoAnual;
        cantidadRoCn += 1;
      }
    }).toList();

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'OCUPADO') &&
          (e.fuenteBase == 'RDR') &&
          (e.producto == '3000001. ACCIONES COMUNES')) {
        montoRdrAcEssalud += e.essaludAnual;
        montoRdrAcSueldo += e.montoAnual;
        montoRdrAcAguinaldo += e.aguinaldoAnual;
        cantidadRdrAc += 1;
      }
    }).toList();

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'OCUPADO') &&
          (e.fuenteBase == 'RDR') &&
          (e.producto == '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL')) {
        montoRdrCnSueldo += e.montoAnual;
        montoRdrCnEssalud += e.essaludAnual;
        montoRdrCnAguinaldo += e.aguinaldoAnual;
        cantidadRdrCn += 1;
      }
    }).toList();
    List<ResumenEntity> result = [];

    result.addAll(_buildMontos(montoRoAcSueldo, montoRoAcEssalud,
        montoRoAcAguinaldo, cantidadRoAc, params.presupuestoList, 0));
    result.addAll(_buildMontos(montoRoCnSueldo, montoRoCnEssalud,
        montoRoCnAguinaldo, cantidadRoCn, params.presupuestoList, 4));
    result.addAll(_buildMontos(montoRdrAcSueldo, montoRdrAcEssalud,
        montoRdrAcAguinaldo, cantidadRoAc, params.presupuestoList, 8));
    result.addAll(_buildMontos(montoRdrCnSueldo, montoRdrCnEssalud,
        montoRdrCnAguinaldo, cantidadRdrCn, params.presupuestoList, 12));

    double montoTotales = montoRoAcSueldo +
        montoRoAcEssalud +
        montoRoAcAguinaldo +
        montoRoCnSueldo +
        montoRoCnEssalud +
        montoRoCnAguinaldo +
        montoRdrAcSueldo +
        montoRdrAcAguinaldo +
        montoRdrAcEssalud +
        montoRdrCnSueldo +
        montoRdrCnEssalud +
        montoRdrCnAguinaldo;
    int cantidadTotales =
        cantidadRoAc + cantidadRoCn + cantidadRdrAc + cantidadRdrCn;

    result.add(ResumenEntity(
        anoEje: 0,
        fuente: '',
        producto: '',
        especifica: '',
        pim: params.presupuestoList[16].pim,
        devengado: params.presupuestoList[16].devengado,
        cantidadOcupado: cantidadTotales,
        montoOcupado: double.parse(montoTotales.toStringAsFixed(2)),
        cantidadVacante: 0,
        montoVacante: 0,
        cantidadProyectado: 0,
        montoProyectado: 0,
        cantidadTotal: 0,
        montoTotal: 0,
        saldo: 0));

    montoRoAcSueldo = 0;
    montoRoAcEssalud = 0;
    montoRoAcAguinaldo = 0;
    cantidadRoAc = 0;
    montoRoCnSueldo = 0;
    montoRoCnEssalud = 0;
    montoRoCnAguinaldo = 0;
    cantidadRoCn = 0;
    montoRdrAcSueldo = 0;
    montoRdrAcEssalud = 0;
    montoRdrAcAguinaldo = 0;
    cantidadRdrAc = 0;
    montoRdrCnSueldo = 0;
    montoRdrCnEssalud = 0;
    montoRdrCnAguinaldo = 0;
    cantidadRdrCn = 0;

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'VACANTE') &&
          (e.fuenteBase == 'RO') &&
          (e.producto == '3000001. ACCIONES COMUNES')) {
        montoRoAcEssalud += e.essaludAnual;
        montoRoAcSueldo += e.montoAnual;
        montoRoAcAguinaldo += e.aguinaldoAnual;
        cantidadRoAc += 1;
      }
    }).toList();

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'VACANTE') &&
          (e.fuenteBase == 'RO') &&
          (e.producto == '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL')) {
        montoRoCnSueldo += e.montoAnual;
        montoRoCnEssalud += e.essaludAnual;
        montoRoCnAguinaldo += e.aguinaldoAnual;
        cantidadRoCn += 1;
      }
    }).toList();

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'VACANTE') &&
          (e.fuenteBase == 'RDR') &&
          (e.producto == '3000001. ACCIONES COMUNES')) {
        montoRdrAcEssalud += e.essaludAnual;
        montoRdrAcSueldo += e.montoAnual;
        montoRdrAcAguinaldo += e.aguinaldoAnual;
        cantidadRdrAc += 1;
      }
    }).toList();

    params.baseCasList.map((e) {
      if ((e.estadoActual == 'VACANTE') &&
          (e.fuenteBase == 'RDR') &&
          (e.producto == '3000131. CAMINO NACIONAL CON MANTENIMIENTO VIAL')) {
        montoRdrCnSueldo += e.montoAnual;
        montoRdrCnEssalud += e.essaludAnual;
        montoRdrCnAguinaldo += e.aguinaldoAnual;
        cantidadRdrCn += 1;
      }
    }).toList();
    montoTotales = montoRoAcSueldo +
        montoRoAcEssalud +
        montoRoAcAguinaldo +
        montoRoCnSueldo +
        montoRoCnEssalud +
        montoRoCnAguinaldo +
        montoRdrAcSueldo +
        montoRdrAcAguinaldo +
        montoRdrAcEssalud +
        montoRdrCnSueldo +
        montoRdrCnEssalud +
        montoRdrCnAguinaldo;
    cantidadTotales =
        cantidadRoAc + cantidadRoCn + cantidadRdrAc + cantidadRdrCn;

    result[0].montoVacante = montoRoAcSueldo;
    result[1].montoVacante = montoRoAcEssalud;
    result[2].montoVacante = montoRoAcAguinaldo;
    result[0].cantidadVacante = cantidadRoAc;
    result[0].cantidadProyectado =
        result[0].cantidadOcupado + result[0].cantidadVacante;
    result[0].montoProyectado = result[0].montoOcupado + result[0].montoVacante;
    result[1].cantidadProyectado =
        result[1].cantidadOcupado + result[1].cantidadVacante;
    result[1].montoProyectado = result[1].montoOcupado + result[1].montoVacante;
    result[2].cantidadProyectado =
        result[2].cantidadOcupado + result[2].cantidadVacante;
    result[2].montoProyectado = result[2].montoOcupado + result[2].montoVacante;
    // TOTAL ENE-DIC
    result[0].cantidadTotal = result[0].cantidadProyectado;
    result[0].montoTotal = result[0].devengado + result[0].montoProyectado;
    result[1].montoTotal = result[1].devengado + result[1].montoProyectado;
    result[2].montoTotal = result[2].devengado + result[2].montoProyectado;
    result[3].montoTotal = result[3].devengado + result[3].montoProyectado;
    // SALDOS
    result[0].saldo = result[0].pim - result[0].montoTotal;
    result[1].saldo = result[1].pim - result[1].montoTotal;
    result[2].saldo = result[2].pim - result[2].montoTotal;
    result[3].saldo = result[3].pim - result[3].montoTotal;

    result[4].montoVacante = montoRoCnSueldo;
    result[5].montoVacante = montoRoCnEssalud;
    result[6].montoVacante = montoRoAcAguinaldo;
    result[4].cantidadVacante = cantidadRoCn;
    result[4].cantidadProyectado =
        result[4].cantidadOcupado + result[4].cantidadVacante;
    result[4].montoProyectado = result[4].montoOcupado + result[4].montoVacante;
    result[5].cantidadProyectado =
        result[5].cantidadOcupado + result[5].cantidadVacante;
    result[5].montoProyectado = result[5].montoOcupado + result[5].montoVacante;
    result[6].cantidadProyectado =
        result[6].cantidadOcupado + result[6].cantidadVacante;
    result[6].montoProyectado = result[6].montoOcupado + result[6].montoVacante;
    // TOTAL ENE-DIC
    result[4].cantidadTotal = result[4].cantidadProyectado;
    result[4].montoTotal = result[4].devengado + result[4].montoProyectado;
    result[5].montoTotal = result[5].devengado + result[5].montoProyectado;
    result[6].montoTotal = result[6].devengado + result[6].montoProyectado;
    result[7].montoTotal = result[7].devengado + result[7].montoProyectado;
    // SALDOS
    result[4].saldo = result[4].pim - result[4].montoTotal;
    result[5].saldo = result[5].pim - result[5].montoTotal;
    result[6].saldo = result[6].pim - result[6].montoTotal;
    result[7].saldo = result[7].pim - result[7].montoTotal;

    result[8].montoVacante = montoRdrAcSueldo;
    result[9].montoVacante = montoRdrAcEssalud;
    result[10].montoVacante = montoRoAcAguinaldo;
    result[8].cantidadVacante = cantidadRdrAc;
    result[8].cantidadProyectado =
        result[8].cantidadOcupado + result[8].cantidadVacante;
    result[8].montoProyectado = result[8].montoOcupado + result[8].montoVacante;
    result[9].cantidadProyectado =
        result[9].cantidadOcupado + result[9].cantidadVacante;
    result[9].montoProyectado = result[9].montoOcupado + result[9].montoVacante;
    result[10].cantidadProyectado =
        result[10].cantidadOcupado + result[10].cantidadVacante;
    result[10].montoProyectado =
        result[10].montoOcupado + result[10].montoVacante;
    // TOTAL ENE-DIC
    result[8].cantidadTotal = result[8].cantidadProyectado;
    result[8].montoTotal = result[8].devengado + result[8].montoProyectado;
    result[9].montoTotal = result[9].devengado + result[9].montoProyectado;
    result[10].montoTotal = result[10].devengado + result[10].montoProyectado;
    result[11].montoTotal = result[11].devengado + result[11].montoProyectado;
    // SALDOS
    result[8].saldo = result[8].pim - result[8].montoTotal;
    result[9].saldo = result[9].pim - result[9].montoTotal;
    result[10].saldo = result[10].pim - result[10].montoTotal;
    result[11].saldo = result[11].pim - result[11].montoTotal;

    result[12].montoVacante = montoRdrCnSueldo;
    result[13].montoVacante = montoRdrCnEssalud;
    result[14].montoVacante = montoRdrCnAguinaldo;
    result[12].cantidadVacante = cantidadRdrCn;
    result[12].cantidadProyectado =
        result[12].cantidadOcupado + result[12].cantidadVacante;
    result[12].montoProyectado =
        result[12].montoOcupado + result[12].montoVacante;
    result[13].cantidadProyectado =
        result[13].cantidadOcupado + result[13].cantidadVacante;
    result[13].montoProyectado =
        result[13].montoOcupado + result[13].montoVacante;
    result[14].cantidadProyectado =
        result[14].cantidadOcupado + result[14].cantidadVacante;
    result[14].montoProyectado =
        result[14].montoOcupado + result[14].montoVacante;
    // TOTAL ENE-DIC
    result[12].cantidadTotal = result[12].cantidadProyectado;
    result[12].montoTotal = result[12].devengado + result[12].montoProyectado;
    result[13].montoTotal = result[13].devengado + result[13].montoProyectado;
    result[14].montoTotal = result[14].devengado + result[14].montoProyectado;
    result[15].montoTotal = result[15].devengado + result[15].montoProyectado;

    // SALDOS
    result[12].saldo = result[12].pim - result[12].montoTotal;
    result[13].saldo = result[13].pim - result[13].montoTotal;
    result[14].saldo = result[14].pim - result[14].montoTotal;
    result[15].saldo = result[15].pim - result[15].montoTotal;

    result[16].cantidadVacante = cantidadTotales;
    result[16].montoVacante = montoTotales;
    result[16].cantidadProyectado =
        result[16].cantidadOcupado + result[16].cantidadVacante;
    result[16].montoProyectado =
        result[16].montoOcupado + result[16].montoVacante;
    // TOTAL ENE-DIC
    result[16].cantidadTotal = result[16].cantidadProyectado;
    result[16].montoTotal = result[16].devengado + result[16].montoProyectado;
    // SALDOS
    result[16].saldo = result[16].pim - result[16].montoTotal;

    return Future.value(Right(result));
  }

  List<ResumenEntity> _buildMontos(
      double _montoRoAcSueldo,
      double _montoRoAcEssalud,
      double _montoRoAcAguinaldo,
      int _cantidad,
      List<PresupuestoCasEntity> _presupuesto,
      int idxPresupuesto) {
    List<ResumenEntity> resultado = [];

    resultado.add(ResumenEntity(
        anoEje: _presupuesto[idxPresupuesto].anoEje,
        fuente: _presupuesto[idxPresupuesto].fuente,
        producto: _presupuesto[idxPresupuesto].producto,
        especifica: _presupuesto[idxPresupuesto].clasificador,
        pim: _presupuesto[idxPresupuesto].pim,
        devengado: _presupuesto[idxPresupuesto].devengado,
        cantidadOcupado: _cantidad,
        montoOcupado: double.parse(_montoRoAcSueldo.toStringAsFixed(2)),
        cantidadVacante: 0,
        montoVacante: 0,
        cantidadProyectado: 0,
        montoProyectado: 0,
        cantidadTotal: 0,
        montoTotal: 0,
        saldo: 0));

    resultado.add(ResumenEntity(
        anoEje: _presupuesto[idxPresupuesto + 1].anoEje,
        fuente: _presupuesto[idxPresupuesto + 1].fuente,
        producto: _presupuesto[idxPresupuesto + 1].producto,
        especifica: _presupuesto[idxPresupuesto + 1].clasificador,
        pim: _presupuesto[idxPresupuesto + 1].pim,
        devengado: _presupuesto[idxPresupuesto + 1].devengado,
        cantidadOcupado: 0,
        montoOcupado: double.parse(_montoRoAcEssalud.toStringAsFixed(2)),
        cantidadVacante: 0,
        montoVacante: 0,
        cantidadProyectado: 0,
        montoProyectado: 0,
        cantidadTotal: 0,
        montoTotal: 0,
        saldo: 0));

    resultado.add(ResumenEntity(
        anoEje: _presupuesto[idxPresupuesto + 2].anoEje,
        fuente: _presupuesto[idxPresupuesto + 2].fuente,
        producto: _presupuesto[idxPresupuesto + 2].producto,
        especifica: _presupuesto[idxPresupuesto + 2].clasificador,
        pim: _presupuesto[idxPresupuesto + 2].pim,
        devengado: _presupuesto[idxPresupuesto + 2].devengado,
        cantidadOcupado: 0,
        montoOcupado: double.parse(_montoRoAcAguinaldo.toStringAsFixed(2)),
        cantidadVacante: 0,
        montoVacante: 0,
        cantidadProyectado: 0,
        montoProyectado: 0,
        cantidadTotal: 0,
        montoTotal: 0,
        saldo: 0));

    resultado.add(ResumenEntity(
        anoEje: _presupuesto[idxPresupuesto + 3].anoEje,
        fuente: _presupuesto[idxPresupuesto + 3].fuente,
        producto: _presupuesto[idxPresupuesto + 3].producto,
        especifica: _presupuesto[idxPresupuesto + 3].clasificador,
        pim: _presupuesto[idxPresupuesto + 3].pim,
        devengado: _presupuesto[idxPresupuesto + 3].devengado,
        cantidadOcupado: 0,
        montoOcupado: 0,
        cantidadVacante: 0,
        montoVacante: 0,
        cantidadProyectado: 0,
        montoProyectado: 0,
        cantidadTotal: 0,
        montoTotal: 0,
        saldo: 0));
    return resultado;
  }
}

class ParamsResumen extends Equatable {
  final List<BaseCasEntity> baseCasList;
  final List<PresupuestoCasEntity> presupuestoList;

  ParamsResumen({required this.baseCasList, required this.presupuestoList});

  @override
  List<Object?> get props => [
        baseCasList,
      ];
}
