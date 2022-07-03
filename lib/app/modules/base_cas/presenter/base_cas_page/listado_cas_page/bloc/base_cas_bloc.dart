import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/base_cas_entity.dart';
import '../../../../domain/usecases/initial_cas_use_case.dart';
import '../../../../domain/usecases/listar_cas_use_case.dart';
import '../../../../domain/usecases/calcular_cas_use_case.dart';
import '../../parameters_page/bloc/headparameters_bloc.dart';
import '../../parameters_page/utils/export_base_cas.dart';

part 'base_cas_event.dart';
part 'base_cas_state.dart';

class BaseCasBloc extends Bloc<BaseCasEvent, BaseCasState>
    implements Disposable {
  @override
  BaseCasBloc(this.listarUseCase, this.calcularCasUseCase, this.initialUseCase,
      this.headParametersBloc)
      : super(VoidBaseCasState()) {
    on<InitialBaseCasEvent>(_initialEventToBaseCasState);
    on<ExportarBaseCasEvent>(_exportarEventToBaseCasState);
    on<CalcularBaseCasEvent>(_calcularEventToBaseCasState);
    on<FilterBaseCasEvent>(_filterEventToBaseCasState);
    on<ListarBaseCasEvent>(_listaEventToBaseCasState);
  }

  HeadParametersBloc? headParametersBloc;
  StreamSubscription? headSubscription;
  final CalcularCasUseCase calcularCasUseCase;
  final ListarCasUseCase listarUseCase;
  final InitialCasUseCase initialUseCase;

  _initialEventToBaseCasState(
      InitialBaseCasEvent event, Emitter<BaseCasState> emit) async {
    double uit = 0;
    double porcentajeMaximoEssalud = 0;
    double porcentajeDescEssalud = 0;
    double aguinaldoSemestral = 0;
    double porcentajeSctrSalud = 0;
    double porcentajeSctrPension = 0;
    double porcentajeIgv = 0;
    var result = await initialUseCase(ParamsInitial(
        dscVariable: event.dscVariable,
        modalidadId: event.modalidadId,
        anio: event.anio));

    emit(result.fold((l) => ErrorBaseCasState(message: 'error'), (r) {
      for (var item in r.data) {
        if (item['detalle'] == 'UIT') uit = double.parse(item['valor']);
        if (item['detalle'] == 'PORCENTAJE_MAX_ESSALUD')
          porcentajeMaximoEssalud = double.parse(item['valor']);
        if (item['detalle'] == 'PORCENTAJE_DESC_ESSALUD')
          porcentajeDescEssalud = double.parse(item['valor']);
        if (item['detalle'] == 'AGUINALDO_SEMESTRAL')
          aguinaldoSemestral = double.parse(item['valor']);
        if (item['detalle'] == 'PORCENTAJE_PRIMA_SCTR_SALUD')
          porcentajeSctrSalud = double.parse(item['valor']);
        if (item['detalle'] == 'PORCENTAJE_PRIMA_SCTR_PENSION')
          porcentajeSctrPension = double.parse(item['valor']);
        if (item['detalle'] == 'PORCENTAJE_IGV')
          porcentajeIgv = double.parse(item['valor']);
      }
      //print(uit.toString());
      return FormLoadBaseCasState(
          mesInicio: 1,
          mesFin: 12,
          uit: uit,
          porcentajeMaximoEssalud: porcentajeMaximoEssalud,
          porcentajeDescEssalud: porcentajeDescEssalud,
          aguinaldoSemestral: aguinaldoSemestral,
          porcentajeSctrSalud: porcentajeSctrSalud,
          porcentajeSctrPension: porcentajeSctrPension,
          porcentajeIgv: porcentajeIgv);
    }));
  }

  _exportarEventToBaseCasState(event, Emitter<BaseCasState> emit) async {
    if (state is LoadedBaseCasState) {
      LoadedBaseCasState stateCurrent = state as LoadedBaseCasState;
      //yield LoadingBaseCasState();
      List<BaseCasEntity> listado = stateCurrent.listBaseCasCur;
      emit(ExportingBaseCasState());
      await compute(
          generateExcel,
          ParamsCalcular(
              lista: listado,
              uit: event.uit,
              porcentajeMaximoEssalud: event.porcentajeMaximoEssalud,
              aguinaldoSemestral: event.aguinaldoSemestral,
              porcentajeEssalud: event.porcentajeEssalud,
              porcentajePrimaSctrSalud: event.porcentajePrimaSctrSalud,
              porcentajePrimaSctrPension: event.porcentajePrimaSctrPension,
              porcentajeComisionSctrPension:
                  event.porcentajeComisionSctrPension,
              porcentajeIgv: event.porcentajeIgv,
              mesInicio: event.mesInicio,
              mesFin: event.mesFin));
      /*  generateExcel(ParamsCalcular(
          lista: listado,
          uit: event.uit,
          porcentajeMaximoEssalud: event.porcentajeMaximoEssalud,
          aguinaldoSemestral: event.aguinaldoSemestral,
          porcentajeEssalud: event.porcentajeEssalud,
          porcentajePrimaSctrSalud: event.porcentajePrimaSctrSalud,
          porcentajeIgv: event.porcentajeIgv,
          mesInicio: event.mesInicio,
          mesFin: event.mesFin));*/
      //if(compledted)
      emit(ExportedBaseCasState());
    }
  }

  _calcularEventToBaseCasState(event, Emitter<BaseCasState> emit) async {
    if (state is LoadedBaseCasState) {
      LoadedBaseCasState stateCurrent = state as LoadedBaseCasState;
      emit(LoadingBaseCasState());
      List<BaseCasEntity> listado = stateCurrent.listBaseCasCur;
      var result = await calcularCasUseCase(ParamsCalcular(
          lista: listado,
          uit: event.uit,
          porcentajeMaximoEssalud: event.porcentajeMaximoEssalud,
          aguinaldoSemestral: event.aguinaldoSemestral,
          porcentajeEssalud: event.porcentajeEssalud,
          porcentajePrimaSctrSalud: event.porcentajePrimaSctrSalud,
          porcentajePrimaSctrPension: event.porcentajePrimaSctrPension,
          porcentajeComisionSctrPension: event.porcentajeComisionSctrPension,
          porcentajeIgv: event.porcentajeIgv,
          mesInicio: event.mesInicio,
          mesFin: event.mesFin));

      emit(result.fold(
          (l) => ErrorBaseCasState(message: 'Error al calcular'),
          (r) => stateCurrent.coyWidth(
                listBaseCasCur: r.listaBaseCas,
                /*   totalMonto: r.totalMonto,
              totalEssalud: r.totalEssalud,
              totalAguinaldoAnual: r.totalAguinaldoAnual,
              totalEssaludAnual: r.totalEssaludAnual,
              totalMontoAnual: r.totalMontoAnual,
              totalAnual: r.totalAnual-*/
              )));
    }
  }

  _listaEventToBaseCasState(
      ListarBaseCasEvent event, Emitter<BaseCasState> emit) async {
    print('entrando lista base bloc');
    emit(LoadingBaseCasState());
    var result = await listarUseCase(event.anio);
    emit(result.fold((l) {
      return ErrorBaseCasState(message: 'Error al calcular');
    }, (r) {
      List<BaseCasEntity> listaInicial = List<BaseCasEntity>.from(r).toList();
      return LoadedBaseCasState(
        listBaseCasCur: listaInicial,
        listBaseCasInit: r,
      );
    }));
  }

  _filterEventToBaseCasState(event, Emitter<BaseCasState> emit) async {
    if (state is LoadedBaseCasState) {
      LoadedBaseCasState stateCurrent = state as LoadedBaseCasState;
      emit(LoadingBaseCasState());
      //List<BaseCasEntity> listado = listaInicial;
      double totalAnual = 0;
      if (event.filterText == 'TODOS')
        emit(stateCurrent.coyWidth(
          listBaseCasCur: stateCurrent.listBaseCasInit,
        ));
      else {
        List<BaseCasEntity> lista =
            stateCurrent.listBaseCasCur.where((element) {
          if (element.presupuesto == event.filterText ||
              element.estadoAir == event.filterText)
            totalAnual = totalAnual + (element.total);
          return element.presupuesto == event.filterText ||
              element.estadoAir == event.filterText;
        }).toList();
        emit(stateCurrent.coyWidth(
          listBaseCasCur: lista,
        ));
      }
    }
  }

  @override
  Future<void> dispose() {
    headSubscription?.cancel();
    return super.close();
  }
}
