import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';

part 'requerimiento_list_event.dart';
part 'requerimiento_list_state.dart';

class RequerimientoListBloc
    extends Bloc<RequerimientoListEvent, RequerimientoListState> {
  final RequerimientoListUseCase requerimientoListUseCase;

  RequerimientoListBloc({required this.requerimientoListUseCase})
      : super(RequerimientoListInitial()) {
    on<RequerimientoListEvent>(_onRequerimientoListLoadToState);
    on<RequerimientoSetDetailEvent>(_onRequerimientoDetailLoadToState);
  }

  _onRequerimientoListLoadToState(RequerimientoListEvent event,
      Emitter<RequerimientoListState> emit) async {
    emit(RequerimientoListLoading());
    var result = await this.requerimientoListUseCase(
        ParamsRequerimiento(anio: '2022', dscModalidad: 'CAS'));
    emit(result.fold((l) {
      return RequerimientoListLoaded(requerimientoList: []);
    }, (r) => RequerimientoListLoaded(requerimientoList: r.data)));
  }

  _onRequerimientoDetailLoadToState(RequerimientoSetDetailEvent event,
      Emitter<RequerimientoListState> emit) async {
    emit(RequerimientoSetDetailState(
        requerimientoDetail: event.reqrerimientoDetail));
  }
}
