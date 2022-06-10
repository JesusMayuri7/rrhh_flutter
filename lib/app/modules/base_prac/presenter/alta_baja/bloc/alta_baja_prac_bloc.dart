import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/alta_baja_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';

part 'alta_baja_prac_event.dart';
part 'alta_baja_prac_state.dart';

class AltaBajaPracBloc extends Bloc<AltaBajaPracEvent, AltaBajaPracState> {
  final AltaBajaPracUseCase altaBajaPracUseCase;

  AltaBajaPracBloc({required this.altaBajaPracUseCase})
      : super(AltaBajaPracLoading()) {
    on<AltaBajaPracEventLoad>(_onAltaBajaPracEventToState);
  }

  _onAltaBajaPracEventToState(
      AltaBajaPracEventLoad event, Emitter<AltaBajaPracState> emit) async {
    var result = await this.altaBajaPracUseCase(event.params);
    emit(result.fold((l) => AltaBajaPracError(message: l.toString()), (r) {
      PracticanteEntity practicante = r.data as PracticanteEntity;
      return AltaBajaPracLoaded(
          practicanteBajaId: event.params.id, practicanteEntity: practicante);
    }));
  }
}
