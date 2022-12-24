import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/initial_cas_use_case.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/listar_cas_use_case.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/presupuesto_cas_use_case.dart';

import '../../../../../../domain/entities/base_cas_entity.dart';

import '../utils/export_base_cas.dart';

part 'headparameters_event.dart';
part 'headparameters_state.dart';

class HeadParametersBloc
    extends Bloc<HeadParametersEvent, HeadParametersState> {
  HeadParametersBloc(this.initialUseCase, this.calcularCasUseCase,
      this.listarUseCase, this.presupuestoCasUseCase)
      : super(HeadParametersInitialState()) {
    on<HeadParametersListEvent>(_listaEventToBaseCasState);
    on<HeadParametersExportEvent>(_exportEventToHeadParametersState);
    on<HeadParametersCalcularEvent>(_calcularEventToBaseCasState);
    on<HeadParametersFormLoadEvent>(_initialEventToHeadParametersState);
  }

  final InitialCasUseCase initialUseCase;
  final CalcularCasUseCase calcularCasUseCase;
  final ListarCasUseCase listarUseCase;
  final PresupuestoCasUseCase presupuestoCasUseCase;

  _exportEventToHeadParametersState(HeadParametersExportEvent event,
      Emitter<HeadParametersState> emit) async {
    List<PresupuestoCasEntity> pimCas = [];
    List<PresupuestoCasEntity> certificadoCas = [];

    if (state is HeadParametersSuccessState) {
      var resultPresupuestoCas = await presupuestoCasUseCase(event.anio);
      emit(resultPresupuestoCas.fold((l) {
        return (state as HeadParametersSuccessState).copyWith(
            status: StatusCas.failure,
            message: 'Error de presupuesto ' + l.toString());
      }, (r) {
        pimCas = List<PresupuestoCasEntity>.from(r[0].data);
        certificadoCas = List<PresupuestoCasEntity>.from(r[1].data);
        return (state as HeadParametersSuccessState).copyWith(
            status: StatusCas.exportingList, message: 'Exportando Lista');
      }));

      await compute(
          generateExcel,
          ParamsCalcular(
              lista: (state as HeadParametersSuccessState).listadoCas,
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
              mesFin: event.mesFin,
              pim: pimCas,
              certificado: certificadoCas));

      emit((state as HeadParametersSuccessState)
          .copyWith(status: StatusCas.loadedList, message: 'Lista Exportada'));
    }
  }

  _calcularEventToBaseCasState(HeadParametersCalcularEvent event,
      Emitter<HeadParametersState> emit) async {
    if (state is HeadParametersSuccessState) {
      emit((state as HeadParametersSuccessState).copyWith(
          status: StatusCas.calculating, message: 'Calculando lista'));
      var result = await calcularCasUseCase(ParamsCalcular(
          lista: (state as HeadParametersSuccessState).listadoCas,
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

      //var result = await compute(calcularListadoCas, event);
      emit(result.fold(
          (l) => (state as HeadParametersSuccessState).copyWith(
              status: StatusCas.failure, message: 'Error al calcular'), (r) {
        return (state as HeadParametersSuccessState).copyWith(
          status: StatusCas.loadedList,
          uit: event.uit,
          porcentajeMaximoEssalud: event.porcentajeMaximoEssalud,
          aguinaldoSemestral: event.aguinaldoSemestral,
          porcentajeDescEssalud: event.porcentajeEssalud,
          porcentajeSctrSalud: event.porcentajePrimaSctrSalud,
          porcentajePrimaSctrPension: event.porcentajePrimaSctrPension,
          porcentajeComisionSctrPension: event.porcentajeComisionSctrPension,
          porcentajeIgv: event.porcentajeIgv,
          message: 'Calculado',
          listadoCas: r.listaBaseCas,
        );
      }));
    }
  }

  _initialEventToHeadParametersState(HeadParametersFormLoadEvent event,
      Emitter<HeadParametersState> emit) async {
    emit(HeadParametersLoadingState());

    double uit = 0;
    double porcentajeMaximoEssalud = 0;
    double porcentajeDescEssalud = 0;
    double aguinaldoSemestral = 0;
    double porcentajeSctrSalud = 0;
    double porcentajePrimaSctrPension = 0;
    double porcentajeComisionSctrPension = 0;
    double porcentajeIgv = 0;

    var result = await initialUseCase(ParamsInitial(
        dscVariable: event.dscVariable,
        modalidadId: event.modalidadId,
        anio: event.anio));

    emit(result.fold(
        (l) => HeadParametersSuccessState(
            status: StatusCas.failure, message: 'Verique su conexion'), (r) {
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
          porcentajePrimaSctrPension = double.parse(item['valor']);
        if (item['detalle'] == 'PORCENTAJE_COMISION_SCTR_PENSION')
          porcentajeComisionSctrPension = double.parse(item['valor']);
        if (item['detalle'] == 'PORCENTAJE_IGV')
          porcentajeIgv = double.parse(item['valor']);
      }

      return HeadParametersSuccessState(
          status: StatusCas.loadedParameter,
          message: 'Parametros cargados',
          mesInicio: 1,
          mesFin: 12,
          uit: uit,
          porcentajeMaximoEssalud: porcentajeMaximoEssalud,
          porcentajeDescEssalud: porcentajeDescEssalud,
          aguinaldoSemestral: aguinaldoSemestral,
          porcentajeSctrSalud: porcentajeSctrSalud,
          porcentajePrimaSctrPension: porcentajePrimaSctrPension,
          porcentajeComisionSctrPension: porcentajeComisionSctrPension,
          porcentajeIgv: porcentajeIgv,
          isExportingData: false,
          listadoCas: []);
    }));
  }

  _listaEventToBaseCasState(
      HeadParametersListEvent event, Emitter<HeadParametersState> emit) async {
    if (state is HeadParametersSuccessState) {
      emit((state as HeadParametersSuccessState)
          .copyWith(status: StatusCas.loadingList, message: 'Cargando lista'));
      var result = await listarUseCase(event.anio);

      emit(result.fold((l) {
        return HeadParametersSuccessState(
            status: StatusCas.failure, message: 'Error al listar');
      }, (r) {
        List<BaseCasEntity> lista = List<BaseCasEntity>.from(r).toList();
        return (state as HeadParametersSuccessState).copyWith(
            listadoCas: lista,
            status: StatusCas.loadedList,
            message: 'Lista cargada');
      }));
    }
  }
}
