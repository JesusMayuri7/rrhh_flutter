part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginAuthEvent extends AuthEvent {
  final AuthCoreParams params;

  LoginAuthEvent({
    required this.params,
  });

  @override
  List<Object> get props => [this.params];
}

class LogoutAuthEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class LoadPreferencesAuthEvent extends AuthEvent {
  final LoginResponseEntity loginResponseEntity;
  LoadPreferencesAuthEvent({
    required this.loginResponseEntity,
  });
  @override
  List<Object> get props => [loginResponseEntity];
}
