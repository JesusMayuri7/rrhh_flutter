import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_codigo_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_codigo_use_case.dart';

part 'airhsp_codigo_event.dart';
part 'airhsp_codigo_state.dart';

class AirhspCodigoBloc extends Bloc<AirhspCodigoEvent, AirhspCodigoState> {
  final ListarAirhspCodigoUseCase listarAirhspCodigoUseCase;


  AirhspCodigoBloc({
    required this.listarAirhspCodigoUseCase,
  }) : super(AirhspCodigoLoaded()) {
    on<LoadedCodigoEvent>(_onListarBaseEventToState);
    on<SelectedCodigoEvent>(_onSelectedEventToState);
  }

  FutureOr<void> _onListarBaseEventToState(
    LoadedCodigoEvent event, Emitter<AirhspCodigoState> emit) async {
        
    var result = await this.listarAirhspCodigoUseCase(event.paramsCodigo);
    emit(result.fold((l) =>  
      AirhspCodigoLoaded(codigos: [],statusCodigo: StatusCodigo.error), (r) {      
      return AirhspCodigoLoaded(codigos: r.data);
    }));
  }

  FutureOr<void> _onSelectedEventToState(
    SelectedCodigoEvent event, Emitter<AirhspCodigoState> emit) async {    
    emit((state as AirhspCodigoLoaded).copyWith(codigoSeleted: event.airhspCodigo));        
  }
}
