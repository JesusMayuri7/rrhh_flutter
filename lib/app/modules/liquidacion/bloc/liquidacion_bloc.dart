import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_liquidacion_data_initial_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

part 'liquidacion_event.dart';
part 'liquidacion_state.dart';

class LiquidacionBloc extends Bloc<LiquidacionEvent, LiquidacionState> {
  LiquidacionBloc({required this.getDataInitialUseCase})
      : super(LiquidacionInitalState()) {
    on<LiquidacionUpdatedEvent>(_onLiquidacionUpdateEventToState);
    on<LiquidacionDataLoadedEvent>(_onLiquidacionDataLoadedEventToState);
  }

  final GetLiquidacionDataInitialUseCase getDataInitialUseCase;

  _onLiquidacionDataLoadedEventToState(
      LiquidacionDataLoadedEvent event, Emitter<LiquidacionState> emit) async {
    emit(LiquidacionLoadingState());
    var result = await this.getDataInitialUseCase(event.anio);
    emit(result.fold((l) {
      return LiquidacionError(message: l.toString());
    }, (r) {
      return LiquidacionLoadedState(
          metas: r[0].data,
          certificados: r[1].data,
          clasificadores: r[2].data,
          fuentes: r[3].data);
    }));
  }

  _onLiquidacionUpdateEventToState(
      event, Emitter<LiquidacionState> emit) async {
    if (event is LiquidacionUpdatedEvent) {
      if (state is LiquidacionLoadedState) {
        emit((state as LiquidacionLoadedState)
            .copyWith(dscCertificado: event.dscCertificado));
      }
    }
  }
}
