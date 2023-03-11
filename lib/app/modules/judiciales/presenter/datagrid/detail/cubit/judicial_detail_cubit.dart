// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_detail_entity.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/new_judicial_detail_use_case.dart';
import 'package:rrhh_clean/app/modules/judiciales/presenter/bloc/list/judiciales_list_bloc.dart';

part 'judicial_detail_event.dart';
part 'judicial_detail_state.dart';

class JudicialDetailCubit extends Bloc<JudicialDetailEvent,JudicialDetailState> {

  final JudicialesListBloc judicialListBloc;
  final NewJudicialDetailUseCase newJudicialDetailUseCase;
  StreamSubscription? judicialListSubscripcion;

  JudicialDetailCubit(
    {required this.judicialListBloc,    
    required this.newJudicialDetailUseCase}
  ) : super(JudicialDetailInitial(judicialDetailList: [])) {
        judicialListSubscripcion =
        judicialListBloc.stream.listen((stateList) {
      if (stateList is JudicialesListSetDetail) {
          add(JudicialDetailLoadedEvent(judicialDetailEntity: stateList.judicialDetailEntity,judicialId:stateList.judicialId ));
      }
    });
   on<JudicialDetailLoadedEvent>(_onJudicialDetailLoadedEvent);
   on<JudicialNewDetailEvent>(_onJudicialNewDetailEvent);
  }

  _onJudicialDetailLoadedEvent(JudicialDetailLoadedEvent event, Emitter<JudicialDetailState> emit) async {
      print('event '+event.judicialId.toString());
      emit(JudicialDetailLoaded(judicialDetailList: event.judicialDetailEntity, judicialId: event.judicialId));
  }  

  @override
  Future<void> close() {
   judicialListSubscripcion?.cancel();
   return super.close();
  }

  _onJudicialNewDetailEvent(JudicialNewDetailEvent event, Emitter<JudicialDetailState> emit) async {
      var result = await this.newJudicialDetailUseCase(ParamsNewJudicialDetail(detalle: event.detalle,expedientePvn: event.expedientePvn,
      fechaExpedientePvn: event.fechaExpedientePvn, nroDocumento: event.nroDocumento,judicialId: event.judicialId));
      emit(result.fold((l) {
            return JudicialDetailError(judicialDetailList: [],message: l.toString());
      },(r){
          JudicialDetailEntity judicialDetail = r.data as JudicialDetailEntity;
          return JudicialDetailLoaded(judicialDetailList: [judicialDetail,...state.judicialDetailList] , judicialId: event.judicialId);
      }));
     
  }
}


