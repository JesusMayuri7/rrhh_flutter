part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();

/*   List<Object> get props => []; */
}

class LoginAuthEvent extends AuthEvent {
  final AuthCoreParams params;

  LoginAuthEvent({
    required this.params,
  });

/*   @override
  List<Object> get props => [this.params]; */
}

class LogoutAuthEvent extends AuthEvent {

/*   @override
  List<Object> get props => []; */
}

class LoadPreferencesAuthEvent extends AuthEvent {
  final SessionEntity sessionEntity;

  LoadPreferencesAuthEvent({
    required this.sessionEntity,
  });

/*   @override
  List<Object> get props => [sessionEntity]; */
}
