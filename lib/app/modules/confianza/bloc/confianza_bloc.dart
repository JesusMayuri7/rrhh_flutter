import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/entities/area_entity.dart';

import '../domain/usecases/get_area_use_case.dart';
import '../../../../core/domain/use_cases/usecase.dart';

part 'confianza_event.dart';
part 'confianza_state.dart';

class ConfianzaBloc extends Bloc<ConfianzaEvent, ConfianzaState> {
  ConfianzaBloc(
    this.getListAreaUseCase,
  ) : super(ConfianzaInitial()) {
    on<ConfianzaAreaEventLoading>(_onConfianzaAreaEventToState);
  }

  final GetListAreaUseCase getListAreaUseCase;

  _onConfianzaAreaEventToState(event, Emitter<ConfianzaState> emit) async {
    if (event is ConfianzaAreaEventLoading) {
      emit(ConfianzaAreaStateLoading());
      var result = await this.getListAreaUseCase(NoParams());
      emit(result.fold((l) {
        print('error ' + l.toString());
        return ConfianzaAreaStateError();
      }, (r) {
        print('cargo areas ' + r.data.toString());
        return ConfianzaAreaStateLoaded(listAreas: r.data as List<AreaEntity>);
      }));
    }
  }
}
