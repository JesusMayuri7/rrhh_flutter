// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:rrhh_clean/core/domain/entities/session_entity.dart';
import 'package:rrhh_clean/core/presenter/logout_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_event.dart';
import 'app_state.dart';

export 'app_event.dart';
export 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  Future<SharedPreferences> preferences;
  @override
  AppBloc({required this.preferences})
      : super(InitialAppState(sessionEntity: null)) {
    on<AppLogingEvent>((event, emit) => _onLogingToState(event, emit));
    on<AppLogoutEvent>((event, emit) => _onLogoutToState(event, emit));
    on<AppInitEvent>((event, emit) => _onInitToState(event, emit));
  }

  _onLogingToState(AppLogingEvent event, Emitter<AppState> emit) async {
    print('event appbloc ' + event.sessionEntity.toString());
    emit(AppLoggedState(sessionEntity: event.sessionEntity));
  }

  _onLogoutToState(AppLogoutEvent event, Emitter<AppState> emit) async {
    emit(AppLogoutState(sessionEntity: null));
  }

  _onInitToState(AppInitEvent event, Emitter<AppState> emit) {
    print('init appbloc');
    this.preferences.then((SharedPreferences prefs) {
      final String token = prefs.getString('token') ?? '';
      final String anio = prefs.getString('anio') ?? '';
      final String message = prefs.getString('message') ?? '';
      final bool status = prefs.getBool('status') ?? false;
      final bool isLogged = prefs.getBool('isLogged') ?? false;
      final int expiresIn = prefs.getInt('expiresIn') ?? 0;
      final String email = prefs.getString('email') ?? '';
      print('token ' + token.toString());
      if (token.isNotEmpty) {
        emit(AppLoggedState(
            sessionEntity: SessionEntity(
                status: status,
                token: token,
                message: message,
                expiresIn: expiresIn,
                anio: anio,
                isLogged: isLogged,
                email: email)));
        print('emit AppLoggedState');
      } else {
        print('emit AppLogoutState');
        emit(AppLogoutState(sessionEntity: null));
      }
    });
  }
}
