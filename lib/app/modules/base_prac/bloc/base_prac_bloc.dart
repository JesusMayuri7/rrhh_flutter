import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/get_data_initial_prac_use_case.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

part 'base_prac_event.dart';
part 'base_prac_state.dart';

class BasePracBloc extends Bloc<BasePracEvent, BasePracState> {
  BasePracBloc({required this.getDataInitialPracUseCase})
      : super(BasePracInitialState()) {
    on<BasePracLoadedEvent>(_onBasePracLoadedEvent);
  }

  final GetDataInitialPracUseCase getDataInitialPracUseCase;

  _onBasePracLoadedEvent(
      BasePracLoadedEvent event, Emitter<BasePracState> emit) async {
    emit(BasePracLoadingState());
    var result = await this.getDataInitialPracUseCase('2021');
    emit(result.fold((l) {
      return BasePracErrorState(message: l.toString());
    }, (r) {
      return BasePracLoadedState(
          fuentes: r[0].data, metas: r[1].data, areas: r[2].data);
    }));
  }
}
