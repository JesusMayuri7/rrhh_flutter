import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_module.dart';

import 'package:rrhh_clean/core/auth/login_auth_usecase.dart';
import 'package:rrhh_clean/core/auth/auth_response_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authCoreUseCase}) : super(AuthInitial()) {
    on<LoginAuthEvent>(_onLoginAuthEventToState);
    on<LoadPreferencesAuthEvent>(_onLoadPreferencesAuthEventToState);
  }

  final LoginAuthUseCase authCoreUseCase;

  Future<void> _onLoginAuthEventToState(
      LoginAuthEvent event, Emitter<AuthState> emit) async {
    await Modular.isModuleReady<AppModule>();
    print('event ' + event.toString());

    var result = await this.authCoreUseCase(event.params);
    emit(result.fold((l) {
      print('error ' + l.toString());
      return ErrorAuthState(message: l.toString());
    }, (r) {
      final SharedPreferences preferences = Modular.get<SharedPreferences>();
      preferences.clear();
      preferences.setString('token', r.token);
      preferences.setString('anio', event.params.anio);
      preferences.setString('message', r.message);
      preferences.setBool('status', r.status);
      preferences.setBool('isLogged', true);
      preferences.setInt('expiresIn', r.expiresIn);

      return SuccessAuthState(
          loginResponseEntity: LoginResponseEntity(
              anio: r.anio,
              expiresIn: r.expiresIn,
              isLogged: true,
              message: '',
              status: r.status,
              token: r.token));
    }));
  }

  /*
  FutureOr<void> _onRefreshAuthEventToState(
      RefreshAuthEvent event, Emitter<AuthState> emit) async {
    var result =
        await this.refreshAuthUseCase(RefreshAuthParams(token: event.token));
    emit(result.fold((l) {
      print('error ' + l.toString());
      return ErrorAuthState(message: l.toString());
    }, (r) {
      print('data ' + r.toString());

      //this.bloc.add(AppAnioSelectEvent(event.params.anio));
      return SuccessAuthState(loginResponseEntity: r);
    }));
  }*/

  FutureOr<void> _onLoadPreferencesAuthEventToState(
      LoadPreferencesAuthEvent event, Emitter<AuthState> emit) {
    emit(SuccessAuthState(loginResponseEntity: event.loginResponseEntity));
  }
}
