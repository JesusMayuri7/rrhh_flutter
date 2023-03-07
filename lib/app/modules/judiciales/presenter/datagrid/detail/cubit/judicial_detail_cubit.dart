// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_detail_entity.dart';
import 'package:rrhh_clean/app/modules/judiciales/presenter/bloc/list/judiciales_list_bloc.dart';

part 'judicial_detail_state.dart';
part 'judicial_detail_event.dart';


class JudicialDetailCubit extends Bloc<JudicialDetailEvent,JudicialDetailState> {

  final JudicialesListBloc judicialListBloc;
  StreamSubscription? judicialListSubscripcion;

  JudicialDetailCubit(
    this.judicialListBloc,
  ) : super(JudicialDetailInitial(judicialDetailList: [])) {
        judicialListSubscripcion =
        judicialListBloc.stream.listen((stateList) {
      if (stateList is JudicialDetailLoaded) {
          add(JudicialDetailLoadedEvent());
      }
    });
   on<JudicialDetailLoadedEvent>(_onJudicialDetailLoadedEvent);
  }

  _onJudicialDetailLoadedEvent(JudicialDetailLoadedEvent event, Emitter<JudicialDetailState> emit) async {
      emit(JudicialDetailLoaded(judicialDetailList: state.judicialDetailList));
  }

  @override
  Future<void> close() {
   judicialListSubscripcion?.cancel();
   return super.close();
  }
}


