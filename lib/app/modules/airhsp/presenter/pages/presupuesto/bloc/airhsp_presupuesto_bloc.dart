// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/calcular_airhsp_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/totales_airhsp_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_presupuesto_use_case.dart';

part 'airhsp_presupuesto_event.dart';
part 'airhsp_presupuesto_state.dart';

class AirhspPresupuestoBloc
    extends Bloc<AirhspPresupuestoEvent, AirshpPresupuestoState> {
  final ListarAirhspPresupuestoUseCase listarAirhspPresupuestoUseCase;
  final TotalesAirhspUseCase totalesAirhspUseCase;
  final CalcularAirhspUseCase calcularAirhspUseCase;

  AirhspPresupuestoBloc({
    required this.listarAirhspPresupuestoUseCase,
    required this.totalesAirhspUseCase,
    required this.calcularAirhspUseCase,
  }) : super(AirhspPresupuestoLoaded(bonificacion: false,cts: false, gratificacion:false)) {
    on<ListPracEvent>(_onListarBaseEventToState);
    on<TotalesAirhspEvent>(_onTotalesAirhspEventToState);
    on<CalculoAirhspEvent>(_onCalculoAirhpsEventToState);
  }

  FutureOr<void> _onListarBaseEventToState(
      ListPracEvent event, Emitter<AirshpPresupuestoState> emit) async {
    
    emit(AirhspPresupuestoLoading());
    var result = await this.listarAirhspPresupuestoUseCase(event.anio);
    emit(result.fold((l) => AirhspPresupuestoError(message: l.toString()), (r) {
      final listPresupuesto = List<AirhspPresupuestoEntity>.of((r.data as List<AirhspPresupuestoEntity>).map((e) {
         return e.totales();
      }));
      return AirhspPresupuestoLoaded(listPracticanteFiltered: listPresupuesto,bonificacion: event.bonificacion,cts: event.cts,
      gratificacion:event.gratificacion);
    }));
  }

    FutureOr<void> _onTotalesAirhspEventToState(
      TotalesAirhspEvent event, Emitter<AirshpPresupuestoState> emit) async {
    if(state is AirhspPresupuestoLoaded)
    {
      List<AirhspPresupuestoEntity> listCalculated = List.of((state as AirhspPresupuestoLoaded).listPracticanteFiltered);
      //emit(AirhspPresupuestoLoading());
      var result = await this.totalesAirhspUseCase(listCalculated);
      emit(result.fold(
      (l) => AirhspPresupuestoError(message: l.toString()),
      (r)
      {
        return (state as AirhspPresupuestoLoaded).copyWith(listPracticanteFiltered: r,bonificacion: event.bonificacion,cts: event.cts,gratificacion: event.gratificacion);
      }));
    }   
    else emit((state as AirhspPresupuestoLoaded).copyWith(listPracticanteFiltered: []));   
  }

  FutureOr<void> _onCalculoAirhpsEventToState(CalculoAirhspEvent event, Emitter<AirshpPresupuestoState> emit) async {
        if(state is AirhspPresupuestoLoaded)
    {
      List<AirhspPresupuestoEntity> listCalculated = List.of((state as AirhspPresupuestoLoaded).listPracticanteFiltered);
      //emit(AirhspPresupuestoLoading());
      var result = await this.calcularAirhspUseCase(listCalculated);
      emit(result.fold(
      (l) => AirhspPresupuestoError(message: l.toString()),
      (r)
      {
        return (state as AirhspPresupuestoLoaded).copyWith(listPracticanteFiltered: r,bonificacion: event.bonificacion,cts: event.cts,gratificacion: event.gratificacion);
      }));
    }   
    else emit((state as AirhspPresupuestoLoaded).copyWith(listPracticanteFiltered: []));   
  }
}
