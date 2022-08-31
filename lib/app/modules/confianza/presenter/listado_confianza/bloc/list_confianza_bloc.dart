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
    on<ListConfianzaEventFilter>(_onFilterConfianzaEventToState);
  }

  // Event Update to State
  _onEventUpdatedToState(ListConfianzaEventUpdate _event,
      Emitter<ListConfianzaBlocState> emit) async {
    if (state is ListConfianzaBlocLoaded) {
      emit(ListConfianzaBlocLoaded(
          listConfianzaOriginal: _event.listConfianza,
          listConfianzaFiltered: _event.listConfianza));
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
          listConfianzaOriginal:
              lista.isEmpty ? [] : r.data as List<ConfianzaEntity>,
          listConfianzaFiltered:
              lista.isEmpty ? [] : r.data as List<ConfianzaEntity>);
    }));
  }

  // Event Saved ConfianzaEntity to State
  _onEditSavedToState(ConfianzaEventEditSaved event,
      Emitter<ListConfianzaBlocState> emit) async {
    if (state is ListConfianzaBlocLoaded) {
      List<ConfianzaEntity> listaUpdated = [];
      for (var item in (state as ListConfianzaBlocLoaded).listConfianzaOriginal)
        (item.id == event.confianzaEntity.id)
            ? listaUpdated.add(event.confianzaEntity)
            : listaUpdated.add(item);
      emit(ListConfianzaBlocLoaded(
          listConfianzaOriginal: listaUpdated,
          listConfianzaFiltered: listaUpdated));
    }
  }

  // Event Created ConfianzaEntity to State
  _onNewSavedToState(ConfianzaEventEditCreate event,
      Emitter<ListConfianzaBlocState> emit) async {
    print('nuevo');
    if (state is ListConfianzaBlocLoaded) {
      List<ConfianzaEntity> listaUpdated = [
        event.confianzaEntity,
        ...(state as ListConfianzaBlocLoaded).listConfianzaOriginal
      ];

      emit(ListConfianzaBlocLoaded(
          listConfianzaOriginal: listaUpdated,
          listConfianzaFiltered: listaUpdated));
    }
  }

  FutureOr<void> _onFilterConfianzaEventToState(ListConfianzaEventFilter event,
      Emitter<ListConfianzaBlocState> emit) async {
    if (state is ListConfianzaBlocLoaded) {
      if (event.textFilter.isEmpty) {
        emit((state as ListConfianzaBlocLoaded).copyWith(
            listConfianzaFiltered:
                (state as ListConfianzaBlocLoaded).listConfianzaOriginal));
      } else {
        print(event.textFilter);
        print((state as ListConfianzaBlocLoaded).listConfianzaOriginal.length);
        print((state as ListConfianzaBlocLoaded).listConfianzaFiltered.length);
        List<ConfianzaEntity> listFiltered = List.from(
            (state as ListConfianzaBlocLoaded)
                .listConfianzaOriginal
                .where((element) {
          return (element.cargo.contains(event.textFilter) ||
              element.nombres
                  .toUpperCase()
                  .contains(event.textFilter.toUpperCase()) ||
              element.descArea
                  .toUpperCase()
                  .contains(event.textFilter.toUpperCase()));
        }).toList());
        emit((state as ListConfianzaBlocLoaded)
            .copyWith(listConfianzaFiltered: listFiltered));
      }
    }
  }

  @override
  Future<void> close() {
    editConfianzaSubscripcion.cancel();
    return super.close();
  }
}
