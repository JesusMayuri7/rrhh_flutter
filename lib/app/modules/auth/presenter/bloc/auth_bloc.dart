import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/app/modules/auth/domain/auth_response_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authCoreUseCase}) : super(AuthInitial()) {
    on<LoginAuthEvent>(_onLoginAuthEventToState);
    on<LogoutAuthEvent>(_onLogoutAuthEventToState);
    on<LoadPreferencesAuthEvent>(_onLoadPreferencesAuthEventToState);
  }

  final LoginAuthUseCase authCoreUseCase;

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
      return SuccessAuthState(
          loginResponseEntity: LoginResponseEntity(
              anio: event.params.anio,
              expiresIn: r.expiresIn,
              isLogged: true,
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
    emit(SuccessAuthState(loginResponseEntity: event.loginResponseEntity));
  }
}
