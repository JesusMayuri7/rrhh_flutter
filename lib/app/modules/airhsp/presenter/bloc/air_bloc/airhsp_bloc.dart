import 'package:bloc/bloc.dart';
import '../../../../../bloc/app_bloc.dart';
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
  List<AirhspEntity> listadoActual = [];
  final ListarUseCase _listarUseCase;
  final ConceptosUseCase _conceptosUseCase;
  String itemSelected = '000000';

  String totalPlazas = '0';

  final AppBloc appBloc;

  //late StreamSubscription subscription;

  @override
  AirhspBloc(this._listarUseCase, this.appBloc, this._conceptosUseCase)
      : super(EmptyAirhspState()) {
    on<AirhspEvent>(_airhspEvent);
  }

  _airhspEvent(AirhspEvent event, Emitter<AirhspState> emit) async* {
    if (event is ListarEvent) {
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

    if (event is SearchEvent) {
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

    if (event is SelectedItemEvent) {
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
}
