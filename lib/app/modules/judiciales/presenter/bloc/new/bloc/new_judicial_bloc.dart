import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/judicial_entity.dart';
import '../../../../domain/new_judiciales_use_case.dart';

part 'new_judicial_event.dart';
part 'new_judicial_state.dart';

class NewJudicialBloc extends Bloc<NewJudicialEvent, NewJudicialState> {
  NewJudicialUseCase newJudicialUseCase;

  NewJudicialBloc({required this.newJudicialUseCase})
      : super(NewJudicialInitial()) {
    on<NewDocumentLoadEvent>(_newJudicialLoadEvent);
  }

  FutureOr<void> _newJudicialLoadEvent(
      NewDocumentLoadEvent event, Emitter<NewJudicialState> emit) async {
    var result = await this.newJudicialUseCase(event.paramsNewJudicial);
    emit(result.fold((l) => NewJudicialError(message: l.toString()), (r) {
      return NewJudicialSaved(judicialEntity: r.data);
    }));
  }
}
