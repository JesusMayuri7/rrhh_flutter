import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/subsidio/domain/get_subsidio_devolucion_data_initial_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

part 'subsidio_event.dart';
part 'subsidio_state.dart';

class SubsidioBloc extends Bloc<SubsidioEvent, SubsidioState> {
  SubsidioBloc(
    this.getSubsidioDevolucionDataInitialUseCase,
  ) : super(SubsidioInitial()) {
    on<SubsidioDataInitialLoad>(_onSubsidioDataInitialEventToState);
  }

  final GetSubsidioDevolucionDataInitialUseCase
      getSubsidioDevolucionDataInitialUseCase;

  _onSubsidioDataInitialEventToState(
      SubsidioDataInitialLoad event, Emitter<SubsidioState> emit) async {
    emit(SubsidioLoading());
    var result = await this.getSubsidioDevolucionDataInitialUseCase(event.anio);
    emit(result.fold(
        (l) => SubsidioError(message: l.toString()),
        (r) => SubsidioLoaded(
            metas: r[0].data,
            certificados: r[1].data,
            clasificadores: r[2].data,
            fuentes: r[3].data)));
  }
}
