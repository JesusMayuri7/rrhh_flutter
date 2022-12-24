import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/concepto_entity.dart';
import '../../../domain/use_cases/conceptos_use_case.dart';
import '../../../../../../core/errors/failure.dart';

part 'conceptos_event.dart';
part 'conceptos_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class ConceptosBloc extends Bloc<ConceptosEvent, ConceptosState> {
  final ConceptosUseCase _conceptosUseCase;
  ConceptosBloc(this._conceptosUseCase) : super(ConceptosInitialState()) {
    on<ConceptosLoadEvent>(_conceptosAirhsp);
  }

  _conceptosAirhsp(ConceptosLoadEvent event, Emitter emit) async {
    emit(ConceptosLoadingState());
    var result = await _conceptosUseCase(ParamsConceptos(
        ejecutora: event.ejecutora,
        tipoPersona: event.tipoPersona,
        codPlaza: event.codPlaza));

    emit(result.fold(
      (failure) => ConceptosErrorState(message: _mapFailureToMessage(failure)),
      (data) {
        return ConceptosLoadedState(data);
      },
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
