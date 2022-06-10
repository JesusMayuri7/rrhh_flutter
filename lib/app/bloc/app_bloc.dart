import 'package:bloc/bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

export 'app_event.dart';
export 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  @override
  AppBloc() : super(InitialAppState()) {
    on<AppAnioSelectEvent>(
        (event, emit) => _onAnioSelectedToState(event, emit));
  }

  _onAnioSelectedToState(
      AppAnioSelectEvent event, Emitter<AppState> emit) async {
    print('emitiendo');
    emit(
        AppAnioSelectedState(anioSelected: event.anioSelected, isLogged: true));
  }
}
