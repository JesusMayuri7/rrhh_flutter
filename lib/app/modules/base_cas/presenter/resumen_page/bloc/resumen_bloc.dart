import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/base_cas_entity.dart';
import '../../../domain/entities/presupuesto_cas_entity.dart';
import '../../../domain/entities/resumen_entity.dart';
import '../../../domain/usecases/resumen_cas_use_case.dart';

import '../../base_cas_page/parameters_page/bloc/headparameters_bloc.dart';
import '../../presupuesto_page/bloc/presupuesto_bloc.dart';

part 'resumen_event.dart';
part 'resumen_state.dart';

class ResumenBloc extends Bloc<ResumenEvent, ResumenState> {
  final PresupuestoBloc presupuestoBloc;
  final HeadParametersBloc baseCasBloc;
  StreamSubscription? presupuestoSubscripcion;
  StreamSubscription? baseSubscripcion;

  ResumenCasUseCase resumenCasUseCase;
  List<ResumenEntity> resumen = [];
  List<PresupuestoCasEntity> presupuestoCasListInit = [];

  ResumenBloc(this.presupuestoBloc, this.baseCasBloc, this.resumenCasUseCase)
      : super(ResumenLoaded(resumenCasList: [])) {
    presupuestoSubscripcion = presupuestoBloc.stream.listen((state) {
      if (state is PresupuestoLoaded) {
        print('entro a resumenBloc');
        //add(ResumenCasEventPresupuestoLoading(presupuestoCasList: (presupuestoBloc.state as PresupuestoLoaded).presupuestoCasList));
      }
    });

    baseSubscripcion = baseCasBloc.stream.listen((state) {
      if (state is HeadParametersSuccessState) {
        print('entro a baseCasBloc');
        add(ResumenCasEventBaseCasLoading(
            baseCasList:
                (baseCasBloc.state as HeadParametersSuccessState).listadoCas));
      }
    });

    on<ResumenCasEventPresupuestoLoading>(_onUpdatedPresupuestoCas);
    on<ResumenCasEventRefresh>(_onUpdatedBaseCas);
    on<ResumenCasEventBaseCasLoading>(_onUpdatedBaseCas);
  }

/*
    if (event is ResumenCasEventRefresh) {
      if (presupuestoBloc.state is PresupuestoLoaded) {
        // print((presupuestoBloc.state as PresupuestoLoaded).presupuestoCasList[0].producto);
        yield* _updatedBaseCas(
            (baseCasBloc.state as HeadParametersSuccessState).listadoCas);
      }
      if (baseCasBloc.state is HeadParametersSuccessState) {
        yield* _updatedBaseCas(
            (baseCasBloc.state as HeadParametersSuccessState).listadoCas);
      }
    }

    if (event is ResumenCasEventBaseCasLoading) {
      yield* _updatedBaseCas(event.baseCasList);
    }
    */

  @override
  Future<void> close() {
    presupuestoSubscripcion?.cancel();
    baseSubscripcion?.cancel();
    return super.close();
  }

  _onUpdatedPresupuestoCas(event, Emitter<ResumenState> emit) async* {
    Future.delayed(Duration(milliseconds: 200));
    if (state is ResumenLoaded) {
      List<ResumenEntity> resumen =
          (state as ResumenLoaded).resumenCasList.isEmpty
              ? []
              : (state as ResumenLoaded).resumenCasList;
      if (resumen.isEmpty) {
        for (var i = 0; i < event._presupuestoCasList.length; i++) {
          resumen.add(ResumenEntity(
              anoEje: event._presupuestoCasList[i].anoEje,
              fuente: event._presupuestoCasList[i].fuente,
              producto: event._presupuestoCasList[i].producto,
              especifica: event._presupuestoCasList[i].clasificador,
              pim: event._presupuestoCasList[i].pim,
              devengado: event._presupuestoCasList[i].devengado,
              cantidadOcupado: 0,
              montoOcupado: 0,
              cantidadVacante: 0,
              montoVacante: 0,
              cantidadProyectado: 0,
              montoProyectado: 0,
              cantidadTotal: 0,
              montoTotal: 0,
              saldo: 0));
        }
      } else {
        for (var i = 0; i < event._presupuestoCasList.length; i++) {
          resumen[i].anoEje = event._presupuestoCasList[i].anoEje;
          resumen[i].fuente = event._presupuestoCasList[i].fuente;
          resumen[i].producto = event._presupuestoCasList[i].producto;
          resumen[i].especifica = event._presupuestoCasList[i].clasificador;
          resumen[i].pim = event._presupuestoCasList[i].pim;
          resumen[i].devengado = event._presupuestoCasList[i].devengado;
        }
      }
      yield ResumenLoaded(resumenCasList: resumen);
    }
  }

  _onUpdatedBaseCas(event, Emitter<ResumenState> emit) async* {
    if (state is ResumenLoaded) {
      List<ResumenEntity> resumen =
          (state as ResumenLoaded).resumenCasList.isEmpty
              ? []
              : (state as ResumenLoaded).resumenCasList;

      List<ResumenEntity> calculadoResumen = [];
      List<PresupuestoCasEntity> presupuesto = [];

      if (presupuestoBloc.state is PresupuestoLoaded)
        presupuesto =
            (presupuestoBloc.state as PresupuestoLoaded).presupuestoCasList;

      var result = await this.resumenCasUseCase(ParamsResumen(
          baseCasList: event._baseCasList, presupuestoList: presupuesto));
      result.fold((l) => print('error' + l.toString()), (r) {
        calculadoResumen = r;
      });

      if (resumen.isEmpty) {
        for (var i = 0; i < calculadoResumen.length; i++) {
          resumen.add(ResumenEntity(
              anoEje: 0,
              fuente: '',
              producto: '',
              especifica: '',
              pim: 0,
              devengado: 0,
              cantidadOcupado: 0,
              montoOcupado: 0,
              cantidadVacante: 0,
              montoVacante: 0,
              cantidadProyectado: 0,
              montoProyectado: 0,
              cantidadTotal: 0,
              montoTotal: 0,
              saldo: 0));
        }
      } else {
        for (var i = 0; i < calculadoResumen.length; i++) {
          resumen[i].anoEje = calculadoResumen[i].anoEje;
          resumen[i].fuente = calculadoResumen[i].fuente;
          resumen[i].producto = calculadoResumen[i].producto;
          resumen[i].especifica = calculadoResumen[i].especifica;
          resumen[i].pim = calculadoResumen[i].pim;
          resumen[i].devengado = calculadoResumen[i].devengado;
          resumen[i].cantidadOcupado = calculadoResumen[i].cantidadOcupado;
          resumen[i].cantidadVacante = calculadoResumen[i].cantidadVacante;
          resumen[i].montoOcupado = calculadoResumen[i].montoOcupado;
          resumen[i].montoVacante = calculadoResumen[i].montoVacante;
          resumen[i].cantidadProyectado =
              calculadoResumen[i].cantidadProyectado;
          resumen[i].montoProyectado = calculadoResumen[i].montoProyectado;
          resumen[i].cantidadTotal = calculadoResumen[i].cantidadTotal;
          resumen[i].montoTotal = calculadoResumen[i].montoTotal;
          resumen[i].saldo = calculadoResumen[i].saldo;
        }
      }
      emit(ResumenLoaded(resumenCasList: resumen));
    }
    //print(resumen.length.toString());
  }
}
