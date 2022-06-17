import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/get_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/update_subsidio_devolucion_usecase.dart';

part 'subsidio_devolucion_event.dart';
part 'subsidio_devolucion_state.dart';

class SubsidioDevolucionBloc
    extends Bloc<SubsidioDevolucionEvent, SubsidioDevolucionState> {
  SubsidioDevolucionBloc(
      {required this.getSubsidioDevolucionUseCase,
      required this.updateSubsidioDevolucionUseCase})
      : super(SubsidioDevolucionInitial()) {
    on<SubsidioDevolucionLoad>(_onSubsidioDevolucionLoadEventToState);
    on<SubsidioDevolucionModalidad>(_onSubsidioDevolucionModalidadToState);
    on<SubsidioDevolucionUpdate>(_onSubsidioDevolucionUpdateEventToState);
  }

  final GetSubsidioDevolucionUseCase getSubsidioDevolucionUseCase;
  final UpdateSubsidioDevolucionUseCase updateSubsidioDevolucionUseCase;

  _onSubsidioDevolucionLoadEventToState(SubsidioDevolucionLoad event,
      Emitter<SubsidioDevolucionState> emit) async {
    emit(SubsidioDevolucionLoading());
    print('load');
    var result = await this.getSubsidioDevolucionUseCase(event.anio);
    emit(result.fold((l) {
      return SubsidioDevolucionError(message: l.toString());
    }, (r) {
      return SubsidioDevolucionLoaded(
          subsidioDevolucionList: r.data,
          subsidioDevolucionFiltered: (r.data as List<SubsidioDevolucionEntity>)
              .where((element) => element.dscModalidad == event.modalidad)
              .toList(),
          modalidad: event.modalidad);
    }));
  }

  _onSubsidioDevolucionModalidadToState(SubsidioDevolucionModalidad event,
      Emitter<SubsidioDevolucionState> emit) async {
    if (state is SubsidioDevolucionLoaded)
      emit((state as SubsidioDevolucionLoaded).copyWith(
        modalidad: event.modalidad,
        subsidioDevolucionFiltered: (state as SubsidioDevolucionLoaded)
            .subsidioDevolucionList
            .where((element) => element.dscModalidad == event.modalidad)
            .toList(),
      ));
  }

  _onSubsidioDevolucionUpdateEventToState(
      event, Emitter<SubsidioDevolucionState> emit) async {
    if (event is SubsidioDevolucionUpdate) {
      var result = await this.updateSubsidioDevolucionUseCase(
          ParamsUpdateSubsidio(
              subsidioDevolucionId: event.id,
              campo: event.campo,
              valor: event.valor));
      emit(result.fold((l) => SubsidioDevolucionError(message: l.toString()),
          (r) => SubsidioDevolucionError(message: 'l.toString(')
          //SubsidioDevolucionLoaded(subsidioDevolucionList: r.data, modalidad: event.modalidad)
          ));
    }
  }
}
