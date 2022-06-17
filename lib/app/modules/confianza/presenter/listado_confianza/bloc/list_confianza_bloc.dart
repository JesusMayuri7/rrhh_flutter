import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/confianza_entity.dart';
import '../../../domain/usecases/get_confianza_use_case.dart';
import '../../edit_confianza/bloc/edti_confianza_bloc.dart';

part 'list_confianza_event.dart';
part 'list_confianza_state.dart';

class ListConfianzaBloc
    extends Bloc<ListConfianzaBlocEvent, ListConfianzaBlocState> {
  final GetListConfianzaUseCase getListConfianzaUseCase;
  final EditConfianzaBloc editConfianzaBloc;
  late StreamSubscription editConfianzaSubscripcion;

  ListConfianzaBloc(this.getListConfianzaUseCase, this.editConfianzaBloc)
      : super(ListConfianzaBlocInitial()) {
    editConfianzaSubscripcion = editConfianzaBloc.stream.listen((state) {
      if (state is EdtiConfianzaSaved) {
        add(ConfianzaEventEditSaved(confianzaEntity: state.confianzaEntity));
      } else if (state is EditConfianzaCreated) {
        add(ConfianzaEventEditCreate(confianzaEntity: state.confianzaEntity));
      }
    });

    on<ListConfianzaEventUpdate>(_onEventUpdatedToState);
    on<ListConfianzaEventGet>(_onEventGetToState);
    on<ConfianzaEventEditSaved>(_onEditSavedToState);
    on<ConfianzaEventEditCreate>(_onNewSavedToState);
  }

  // Event Update to State
  _onEventUpdatedToState(ListConfianzaEventUpdate _event,
      Emitter<ListConfianzaBlocState> emit) async {
    if (state is ListConfianzaBlocLoaded) {
      emit(ListConfianzaBlocLoaded(listConfianza: _event.listConfianza));
    }
  }

  // Event Get to State
  _onEventGetToState(ListConfianzaEventGet _event,
      Emitter<ListConfianzaBlocState> emit) async {
    emit(ListConfianzaBlocLoading());
    var result = await this.getListConfianzaUseCase(_event.anio);

    emit(result.fold((l) {
      return ListConfianzaBlocError(message: l.toString());
    }, (r) {
      final List<ConfianzaEntity> lista = r.data as List<ConfianzaEntity>;

      return ListConfianzaBlocLoaded(
          listConfianza: lista.isEmpty ? [] : r.data as List<ConfianzaEntity>);
    }));
  }

  // Event Saved ConfianzaEntity to State
  _onEditSavedToState(ConfianzaEventEditSaved event,
      Emitter<ListConfianzaBlocState> emit) async {
    if (state is ListConfianzaBlocLoaded) {
      List<ConfianzaEntity> listaUpdated = [];
      for (var item in (state as ListConfianzaBlocLoaded).listConfianza)
        (item.id == event.confianzaEntity.id)
            ? listaUpdated.add(event.confianzaEntity)
            : listaUpdated.add(item);
      emit(ListConfianzaBlocLoaded(listConfianza: listaUpdated));
    }
  }

  // Event Created ConfianzaEntity to State
  _onNewSavedToState(ConfianzaEventEditCreate event,
      Emitter<ListConfianzaBlocState> emit) async {
    print('nuevo');
    if (state is ListConfianzaBlocLoaded) {
      List<ConfianzaEntity> listaUpdated = [
        event.confianzaEntity,
        ...(state as ListConfianzaBlocLoaded).listConfianza
      ];

      emit(ListConfianzaBlocLoaded(listConfianza: listaUpdated));
    }
  }

  @override
  Future<void> close() {
    editConfianzaSubscripcion.cancel();
    return super.close();
  }
}
