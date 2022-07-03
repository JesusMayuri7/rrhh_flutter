import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/base_cap_entity.dart';
import '../../../../domain/use_cases/get_list_base_cap_usecase.dart';

part 'listado_cap_event.dart';
part 'listado_cap_state.dart';

class ListadoCapBloc extends Bloc<ListadoCapEvent, ListadoCapState> {
  ListadoCapBloc(
    this.listarCapUseCase,
  ) : super(ListadoCapInitial()) {
    on<CapLoadEvent>(_onCapLoadEvent);
  }

  final GetListBaseCapUseCase listarCapUseCase;

  _onCapLoadEvent(CapLoadEvent event, Emitter<ListadoCapState> emit) async {
    emit(ListadoCapLoading());
    var result = await this.listarCapUseCase(event.anio);
    emit(result.fold((l) => ListadoCapError(message: l.toString()),
        (r) => ListadoCapLoaded(listadoCap: r.data)));
  }
}
