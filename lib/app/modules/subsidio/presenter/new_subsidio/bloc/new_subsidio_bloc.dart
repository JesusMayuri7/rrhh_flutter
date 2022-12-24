import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';

part 'new_subsidio_event.dart';
part 'new_subsidio_state.dart';

class NewSubsidioBloc extends Bloc<NewSubsidioEvent, NewSubsidioState> {
  NewSubsidioBloc({required this.newSubsidioDevolucionUseCase})
      : super(NewSubsidioInitial()) {
    on<AddSubsidioEvent>(_onAddSubsidioEventToState);
  }

  final NewSubsidioDevolucionUseCase newSubsidioDevolucionUseCase;

  _onAddSubsidioEventToState(
      AddSubsidioEvent event, Emitter<NewSubsidioState> emit) async {
    var result = await this.newSubsidioDevolucionUseCase(event.params);
    emit(result.fold((l) {
      return NewSubsidioError(message: l.toString());
    }, (r) {
      return NewSubsidioAdded(subsidioDevolucionEntity: r);
    }));
  }
}
