import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/download_file_use_case.dart';

import '../../../domain/entities/airhsp_entity.dart';
import '../../../domain/use_cases/conceptos_use_case.dart';

import '../../../domain/use_cases/listar_use_case.dart';

import 'airhsp_event.dart';
import 'airhsp_state.dart';

export 'airhsp_event.dart';
export 'airhsp_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class AirhspBloc extends Bloc<AirhspEvent, AirhspState> {
  AirhspBloc(
      this._listarUseCase, this._conceptosUseCase, this._downloadFileUseCase)
      : super(EmptyAirhspState()) {
    on<ListarEvent>(_listarEvent);
    on<SearchEvent>(_searchEvent);
    on<SelectedItemEvent>(_selectedItemEvent);
    on<DownloadFileEvent>(_downloadFileEvent);
  }

  List<AirhspEntity> listadoActual = [];
  final ListarUseCase _listarUseCase;
  final ConceptosUseCase _conceptosUseCase;
  final DownloadFileUseCase _downloadFileUseCase;
  String itemSelected = '000000';

  String totalPlazas = '0';

  _listarEvent(ListarEvent event, Emitter emit) async {
    print('event ' + event.runtimeType.toString());

    print('event listar');
    emit(LoadingAirhspState());
    var result = await _listarUseCase(ParamsListar(
        ejecutora: event.ejecutora, tipoPersona: event.tipoPersona));

    emit(result.fold(
      (failure) {
        return ErrorAirhspState(message: failure.toString());
      },
      (data) {
        this.totalPlazas = data.length.toString();
        this.listadoActual = data;
        //this.appBloc.add(TotalPlazasAppEvent(this.totalPlazas));
        return LoadedAirhspState(listado: data, conceptos: []);
      },
    ));
  }

  _downloadFileEvent(DownloadFileEvent event, Emitter emit) async {
    if (state is LoadedAirhspState) {
      var stateNow = state;
      emit(LoadingAirhspState());
      var result = await _downloadFileUseCase(event.tipoPersona);

      emit(result.fold(
        (failure) {
          return ErrorAirhspState(message: failure.toString());
        },
        (data) {
          return stateNow;
        },
      ));
    }
  }

  FutureOr<void> _searchEvent(event, Emitter<AirhspState> emit) {
    if (state is LoadedAirhspState) {
      if (event.criterio.isNotEmpty) {
        List<AirhspEntity> dummyListData = [];
        (state as LoadedAirhspState).listado.forEach((item) {
          if (item.nombres.contains(event.criterio.toUpperCase())) {
            dummyListData.add(item);
          }
        });
        this.totalPlazas = dummyListData.length.toString();
        emit(LoadedAirhspState(listado: dummyListData, conceptos: []));
      } else {
        this.totalPlazas = listadoActual.length.toString();
        emit(LoadedAirhspState(listado: this.listadoActual, conceptos: []));
      }
    }
  }

  FutureOr<void> _selectedItemEvent(
      SelectedItemEvent event, Emitter<AirhspState> emit) async {
    print('entro al evento SelecteitemdEvent');
    AirhspState currentState = state;
    //yield LoadingAirhspState();
    var result = await _conceptosUseCase(ParamsConceptos(
        ejecutora: event.ejecutora,
        tipoPersona: event.tipoPersona,
        codPlaza: event.codPlaza));

    emit(result.fold(
      (failure) {
        return ErrorAirhspState(message: failure.toString());
      },
      (data) {
        return LoadedAirhspState(
            listado: (currentState as LoadedAirhspState).listado,
            conceptos: data);
      },
    ));
  }
}
