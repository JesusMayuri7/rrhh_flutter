import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/confianza_entity.dart';
import '../../../domain/usecases/post_confianza_use_case.dart';

part 'edti_confianza_event.dart';
part 'edti_confianza_state.dart';

class EditConfianzaBloc extends Bloc<EdtiConfianzaEvent, EdtiConfianzaState> {
  EditConfianzaBloc(
    this.postConfianzaUseCase,
  ) : super(EdtiConfianzaInitial()) {
    on<EditConfianzaEventPost>(_onEditConfianzaEventToState);
  }

  final PostConfianzaUseCase postConfianzaUseCase;

  _onEditConfianzaEventToState(event, Emitter<EdtiConfianzaState> emit) async {
    emit(EditConfianzaSaving());
    if (event is EditConfianzaEventPost) {
      var result = await this.postConfianzaUseCase(event.confianza);

      emit(result.fold((l) {
        return EdtiConfianzaError(message: l.toString());
      }, (r) {
        final ConfianzaEntity confianzaEntity = r.data as ConfianzaEntity;

        /*
        if (listConfianzaBloc.state is ListConfianzaBlocLoaded) {
          List<ConfianzaEntity> listaUpdated = [
            for (var item
                in (listConfianzaBloc.state as ListConfianzaBlocLoaded)
                    .listConfianza)
              if (item.id == confianzaEntity.id)
                item.copyWith(docCese: confianzaEntity.docCese)
              else
                item
          ];

          print('ListLoaded ' + listaUpdated[0].toString());
          listConfianzaBloc
              .add(ListConfianzaEventUpdate(listConfianza: listaUpdated));
        }*/
        if (event.confianza.id == 0)
          return EditConfianzaCreated(confianzaEntity: confianzaEntity);
        else
          return EdtiConfianzaSaved(confianzaEntity: confianzaEntity);
      }));
    }
  }
}
