import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/home/domain/cap_estado_opp_entity.dart';
import 'package:rrhh_clean/app/modules/home/domain/devengado_total_entity.dart';
import 'package:rrhh_clean/app/modules/home/domain/get_home_cap_estado_opp_usecase.dart';
import 'package:rrhh_clean/app/modules/home/domain/get_home_data_initial_usecase.dart';
import 'package:rrhh_clean/app/modules/home/domain/get_home_devengado_total_usescase.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';

part 'homedevengadototal_event.dart';
part 'homedevengadototal_state.dart';

class HomeDevengadoTotalBloc
    extends Bloc<HomeDevengadototalEvent, HomeDevengadoTotalState> {
  HomeDevengadoTotalBloc(
      {required this.getHomeDataInitialUseCase,
      required this.getHomeDevengadoTotalUseCase,
      required this.getHomeCapEstadoOppUseCase})
      : super(HomeDevengadoTotalLoading()) {
    on<HomeDevengadoTotalLoad>(_onHomeDevengadoTotalLoadToState);
  }

  final GetHomeDevengadoTotalUseCase getHomeDevengadoTotalUseCase;
  final GetHomeCapEstadoOppUseCase getHomeCapEstadoOppUseCase;
  final GetHomeDataInitialUseCase getHomeDataInitialUseCase;

  _onHomeDevengadoTotalLoadToState(
      event, Emitter<HomeDevengadoTotalState> emit) async {
    emit(HomeDevengadoTotalLoading());
    var result = await this.getHomeDataInitialUseCase(NoParams());
    emit(result.fold((l) {
      print(l.toString());
      return HomeDevengadoTotalError(message: l.toString());
    }, (r) {
      //List<CapEstadoOppEntity> lista = List.from(r[1].data);
      //List<CapEstadoOppEntity> sum = sumCapEstadoOpp(lista);
      return HomedevengadototalLoaded(
          devengadoTotal: r[0].data, capEstadoOpp: r[1].data);
    }));
  }
}
