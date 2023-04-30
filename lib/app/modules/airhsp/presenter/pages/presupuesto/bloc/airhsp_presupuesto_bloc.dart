// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_presupuesto_use_case.dart';

part 'airhsp_presupuesto_event.dart';
part 'airhsp_presupuesto_state.dart';

class AirhspPresupuestoBloc
    extends Bloc<AirhspPresupuestoEvent, AirshpPresupuestoState> {
  final ListarAirhspPresupuestoUseCase listarAirhspPresupuestoUseCase;

  AirhspPresupuestoBloc({
    required this.listarAirhspPresupuestoUseCase,
  }) : super(AirhspPresupuestoLoaded()) {
    on<ListPracEvent>(_onListarPracEventToState);
  }

  FutureOr<void> _onListarPracEventToState(
      ListPracEvent event, Emitter<AirshpPresupuestoState> emit) async {
    emit(AirhspPresupuestoLoading());
    var result = await this.listarAirhspPresupuestoUseCase(event.anio);
    emit(result.fold((l) => AirhspPresupuestoError(message: l.toString()), (r) {
      return AirhspPresupuestoLoaded(listPracticanteFiltered: r.data);
    }));
  }
}
