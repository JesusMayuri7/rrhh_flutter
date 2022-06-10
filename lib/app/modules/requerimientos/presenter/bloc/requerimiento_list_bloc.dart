import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';

part 'requerimiento_list_event.dart';
part 'requerimiento_list_state.dart';

class RequerimientoListBloc
    extends Bloc<RequerimientoListEvent, RequerimientoListState> {
  RequerimientoListBloc() : super(RequerimientoListInitial()) {
    on<RequerimientoListEvent>(_onRequerimientoListLoadToState);
  }

  _onRequerimientoListLoadToState(
      event, Emitter<RequerimientoListState> emit) async {
    print('event requerimientos');
    emit(RequerimientoListLoaded(requerimientoList: []));
  }
}
