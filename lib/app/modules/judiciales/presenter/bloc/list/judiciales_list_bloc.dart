
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_entity.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/judiciales_list_usecase.dart';

import '../../../domain/judicial_detail_entity.dart';

part 'judiciales_list_event.dart';
part 'judiciales_list_state.dart';

class JudicialesListBloc
    extends Bloc<JudicialesListEvent, JudicialesListState> {
  final JudicialesListUseCase judicialesListUseCase;

  JudicialesListBloc({required this.judicialesListUseCase})
      : super(JudicialesListInitial()) {
    on<JudicialesListLoad>(_onJudicialListLoadToState);
    on<JudicialesListFilter>(_onJudicialListFilterToState);
    on<JudicialesListSetDetailEvent>(_onJudicialListSetDetailEvent);
  }

  _onJudicialListLoadToState(
      JudicialesListLoad event, Emitter<JudicialesListState> emit) async {
    var result =
        await this.judicialesListUseCase(ParamsJudiciales(anio: '2023'));
    emit(result.fold((l) => JudicialesListError(message: l.toString()), (r) {
      return JudicialesListLoaded(
          judicialesListOriginal: r.data, judicialesListFiltered: r.data);
    }));
  }



  _onJudicialListFilterToState(
    JudicialesListFilter event, Emitter<JudicialesListState> emit) async {
    if (state is JudicialesListLoaded) {
    
      if(event.criterio.isNotEmpty){      
        List<JudicialEntity> judiciales = List.from(
          (state as JudicialesListLoaded)
              .judicialesListOriginal
              .where((element) => element.nombres.contains(event.criterio))
              .toList());
        emit((state as JudicialesListLoaded)
          .copyWith(judicialesListFiltered: judiciales));
      }
        emit((state as JudicialesListLoaded).copyWith(judicialesListFiltered: (state as JudicialesListLoaded).judicialesListOriginal));
    }
  }

  _onJudicialListSetDetailEvent(JudicialesListSetDetailEvent event, Emitter<JudicialesListState> emit) {
    emit(JudicialesListSetDetail(
      nombres: event.nombres,
      judicialDetailEntity:  event.judicialesEntity, judicialId: event.judicialId));
  }
}
