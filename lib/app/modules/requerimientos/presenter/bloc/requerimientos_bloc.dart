// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimientos_initial_usecase.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';
import 'package:rrhh_clean/core/domain/entities/tipo_requerimiento_entity.dart';

part 'requerimientos_event.dart';
part 'requerimientos_state.dart';

class RequerimientosBloc
    extends Bloc<RequerimientosEvent, RequerimientosState> {

  final GetRequerimientosInitialUseCase getRequerimientosInitialUseCase;

  RequerimientosBloc({required this.getRequerimientosInitialUseCase})
      : super(RequerimientosInitial()) {
    on<RequerimientosLoadEvent>(_getInitialRequerimientosEvent);
  }


  _getInitialRequerimientosEvent(
      RequerimientosLoadEvent event, Emitter<RequerimientosState> emit) async {

    emit(RequerimientosLoading());
    
    var result = await this.getRequerimientosInitialUseCase(event.anio);
    emit(result.fold(
        (l) => RequerimientosError(message: l.toString()),
        (r) => RequerimientosLoaded(
            areas: r[0].data,
            metas: r[1].data,
            fuentes: r[2].data,
            modalidades: r[3].data,
            tipoRequerimientos: r[4].data
            )));
  }
}
