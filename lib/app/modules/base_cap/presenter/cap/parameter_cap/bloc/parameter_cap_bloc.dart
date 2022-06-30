import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:rrhh_clean/app/modules/base_cap/domain/use_cases/calcular_list_base_cap_usecase.dart';
import 'package:rrhh_clean/app/modules/base_cap/domain/use_cases/get_presupuesto_base_cap_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/presupuesto_entity.dart';

import '../../../../domain/entities/cap_entity.dart';
import '../../../../domain/entities/parameter_cap_entity.dart';
import '../../../../domain/entities/params_cap_calcular.dart';
import '../../../../domain/use_cases/get_list_base_cap_usecase.dart';
import '../../../../domain/use_cases/get_parameter_base_cap_usecase.dart';
import '../utils/export_cap.dart';

part 'parameter_cap_event.dart';
part 'parameter_cap_state.dart';

class ParameterCapBloc extends Bloc<ParameterCapEvent, ParameterCapState> {
  ParameterCapBloc({
    required this.getListBaseCapUseCase,
    required this.getParameterBaseCapUseCase,
    required this.calcularListBaseCapUseCase,
    required this.getPresupuestoBaseCapUseCase,
  }) : super(CapLoadedState()) {
    on<ExportCapEvent>(_onExportCapEventToState);
    on<LoadParameterEvent>(_onLoadParameterEventToState);
    on<LoadCapEvent>(_onLoadCapEventtoState);
    //on<CalcularCapEvent>(_onCalcularCapEvent);
  }

  final GetListBaseCapUseCase getListBaseCapUseCase;
  final GetParameterBaseCapUseCase getParameterBaseCapUseCase;
  final CalcularListBaseCapUseCase calcularListBaseCapUseCase;
  final GetPresupuestoBaseCapUseCase getPresupuestoBaseCapUseCase;

  List<PresupuestoEntity> certificadoCap = [];
  List<PresupuestoEntity> pimCap = [];

  _onLoadCapEventtoState(
      LoadCapEvent event, Emitter<ParameterCapState> emit) async {
    emit(CapLoadingState());
    var result = await this.getListBaseCapUseCase(event.anio);
    emit(result.fold((l) {
      print(l.toString());
      return CapLoadedState(statusCap: StatusCap.error);
    }, (r) {
      List<CapEntity> resultCalc = this.calcularListBaseCapUseCase(
          ParamsCalcularListBaseCap(
              capEntityList: r.data,
              parameterCapEntityList: (state is CapLoadedState)
                  ? (state as CapLoadedState).parameterBaseCap
                  : []));

      return CapLoadedState(
          listadoBaseCap: resultCalc,
          parameterBaseCap: (state is CapLoadedState)
              ? (state as CapLoadedState).parameterBaseCap
              : []);
    }));
  }

  _onLoadParameterEventToState(
      LoadParameterEvent event, Emitter<ParameterCapState> emit) async {
    var result = await this.getParameterBaseCapUseCase(event.anio);
    emit(result.fold((l) {
      return CapLoadedState(statusCap: StatusCap.parameterLoading);
    }, (r) {
      return CapLoadedState(parameterBaseCap: r.data, listadoBaseCap: []);
    }));
  }

  _onExportCapEventToState(
      ExportCapEvent event, Emitter<ParameterCapState> emit) async {
    print('entro...');
    var resultPresupuestoCas = await getPresupuestoBaseCapUseCase(event.anio);
    emit(resultPresupuestoCas.fold((l) {
      print('Error Certiicado ' + l.toString());
      return (state as CapLoadedState).copyWith(statusCap: StatusCap.error);
    }, (r) {
      certificadoCap = List<PresupuestoEntity>.from(r[0].data);
      print('Cert. ' + certificadoCap.length.toString());
      pimCap = List<PresupuestoEntity>.from(r[1].data);
      return (state as CapLoadedState)
          .copyWith(statusCap: StatusCap.capLoading);
    }));

    await compute(
        generateExcel,
        ParamsCapCalcular(
            listCap: (state as CapLoadedState).listadoBaseCap,
            listParameter: (state as CapLoadedState).parameterBaseCap,
            certificadoCap: certificadoCap,
            pimCap: pimCap));
  }

/*
  _onCalcularCapEvent(
      CalcularCapEvent event, Emitter<ParameterCapState> emit) async {
    var resultCalc = await this.calcularListBaseCapUseCase(
        ParamsCalcularListBaseCap(
            capEntityList: event.paramsCalcularListBaseCap.capEntityList,
            parameterCapEntityList:
                event.paramsCalcularListBaseCap.parameterCapEntityList));

    emit(resultCalc.fold(
        (l) => CapLoadedState(status: Status.error),
        (r) => CapLoadedState(
            parameterBaseCap:
                event.paramsCalcularListBaseCap.parameterCapEntityList,
            listadoBaseCap: r)));
  }*/
}
