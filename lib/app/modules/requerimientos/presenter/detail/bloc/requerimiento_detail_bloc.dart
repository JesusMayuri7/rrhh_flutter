import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/list/bloc/requerimiento_list_bloc.dart';

part 'requerimiento_detail_event.dart';
part 'requerimiento_detail_state.dart';

class RequerimientoDetailBloc
    extends Bloc<RequerimientoDetailEvent, RequerimientoDetailState> {
  RequerimientoDetailBloc({required this.requerimientoListBloc})
      : super(RequerimientoDetailInitial()) {
    requerimientoListBlocSubscripcion =
        requerimientoListBloc.stream.listen((stateList) {
      if (stateList is RequerimientoSetDetailState) {
        add(RequerimientoDetailLoad(
            requerimientoDetail: (stateList.requerimientoDetail)));
      }
    });
    on<RequerimientoDetailLoad>(_onRequerimientoDetailLoad);
  }

  final RequerimientoListBloc requerimientoListBloc;
  StreamSubscription? requerimientoListBlocSubscripcion;

  _onRequerimientoDetailLoad(
      RequerimientoDetailLoad event, Emitter<RequerimientoDetailState> emit) {
    emit(RequerimientoDetailLoaded(
        requerimientoDetail: event.requerimientoDetail));
  }

  @override
  Future<void> close() {
    requerimientoListBlocSubscripcion?.cancel();

    return super.close();
  }
}
