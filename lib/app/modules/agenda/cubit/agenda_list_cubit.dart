// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/agenda/agenda_entity.dart';
import 'package:rrhh_clean/app/modules/agenda/agenda_list_usecase.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_params.dart';

import '../agenda_save_usecase.dart';

part 'agenda_list_state.dart';

class AgendaListCubit extends Cubit<AgendaListState> {
  final AgendaListUseCase agendaListUseCase;
  final AgendaSaveUseCase agendaSaveUseCase;

  AgendaListCubit({
    required this.agendaListUseCase,
    required this.agendaSaveUseCase,
  }) : super(AgendaListInitial());

  filtered(String criterio) async {
    if (state is AgendaListLoaded) {
      final _listAgendaOriginal =
          (state as AgendaListLoaded).listAgendaOriginal;
      emit((state as AgendaListLoaded).copyWith(
          listAgendaFiltered: _listAgendaOriginal
              .where((element) =>
                  element.titulo.contains(criterio) ||
                  element.texto.contains(criterio))
              .toList()));
      ;
    }
  }

  loaded(String anio) async {
    emit(AgendaListLoading());
    var response = await this.agendaListUseCase(anio);
    emit(response.fold((l) => AgendaListError(message: l.toString()), (r) {
      return AgendaListLoaded(
          listAgendaFiltered: r.data, listAgendaOriginal: r.data);
    }));
  }

  save(AgendaParams agendaParams) async {
    var response = await this.agendaSaveUseCase(agendaParams);
    emit(response.fold((l) { 
      return AgendaListError(message: l.toString()); }, (r) {
      AgendaEntity agendaEntity = r.data as AgendaEntity;

      if (state is AgendaListLoaded) {
        List<AgendaEntity> listAgendaEntity =
            (state as AgendaListLoaded).listAgendaOriginal.map((e) {
          return e.idtodo == agendaEntity.idtodo ? agendaEntity : e;
        }).toList();

        if (agendaParams.idtodo == 0) listAgendaEntity.insert(0, agendaEntity);

        return (state as AgendaListLoaded).copyWith(
            listAgendaFiltered: listAgendaEntity,
            listAgendaOriginal: listAgendaEntity);
      }
      return AgendaListInitial();
    }));
  }
}
