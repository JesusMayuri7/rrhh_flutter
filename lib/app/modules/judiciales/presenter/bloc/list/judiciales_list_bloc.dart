import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_entity.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/judiciales_list_usecase.dart';

part 'judiciales_list_event.dart';
part 'judiciales_list_state.dart';

class JudicialesListBloc
    extends Bloc<JudicialesListEvent, JudicialesListState> {
  final JudicialesListUseCase judicialesListUseCase;

  JudicialesListBloc({required this.judicialesListUseCase})
      : super(JudicialesListInitial()) {
    on<JudicialesListEvent>(_onJudicialListLoadToState);
  }
  _onJudicialListLoadToState(
      JudicialesListEvent event, Emitter<JudicialesListState> emit) async {
    print('event Judiciales');
    var result =
        await this.judicialesListUseCase(ParamsJudiciales(anio: '2022'));
    emit(result.fold((l) => JudicialesListError(message: l.toString()), (r) {
      print('blocv' + r.data.toString());
      return JudicialesListLoaded(judicialesList: r.data);
    }));
  }
}
