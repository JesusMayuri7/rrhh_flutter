// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/session_entity.dart';
import 'package:rrhh_clean/app/app_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc({
    required this.authCoreUseCase,
    required this.appService,
  }) : super(AuthInitial()) {
    on<LoginAuthEvent>(_onLoginAuthEventToState);
    on<LogoutAuthEvent>(_onLogoutAuthEventToState);
    on<LoadPreferencesAuthEvent>(_onLoadPreferencesAuthEventToState);
  }

  final LoginAuthUseCase authCoreUseCase;
  final AppService appService;

  Future<void> _onLogoutAuthEventToState(
      LogoutAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthInitial());
  }

  Future<void> _onLoginAuthEventToState(
      LoginAuthEvent event, Emitter<AuthState> emit) async {

       
    var result = await this.authCoreUseCase(event.params);
    emit(result.fold((l) {
      return ErrorAuthState(message: l.toString());
    }, (r) {
      appService.saveSession(SessionEntity(
          status: r.status,
          token: r.token,
          message: r.message,
          expiresIn: r.expiresIn,
          anio: r.anio,
          isLogged: r.isLogged,
          email: r.email));
      return SuccessAuthState(
          sessionEntity: SessionEntity(
              anio: event.params.anio,
              expiresIn: r.expiresIn,
              isLogged: r.status,
              message: '',
              status: r.status,
              token: r.token,
              email: event.params.email));
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
    emit(SuccessAuthState(sessionEntity: event.sessionEntity));
  }
}
