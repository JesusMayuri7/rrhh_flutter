part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final LoginResponseEntity? loginResponseEntity;

  const AuthState({
    this.loginResponseEntity,
  });

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(loginResponseEntity: null);
}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final LoginResponseEntity loginResponseEntity;

  SuccessAuthState({
    required this.loginResponseEntity,
  }) : super(loginResponseEntity: loginResponseEntity);

  @override
  List<Object> get props => [this.loginResponseEntity];

  SuccessAuthState copyWith({
    String? anio,
    bool? isLogged,
    LoginResponseEntity? loginResponseEntity,
  }) {
    return SuccessAuthState(
      loginResponseEntity: loginResponseEntity ?? this.loginResponseEntity,
    );
  }
}

class ErrorAuthState extends AuthState {
  final String message;
  ErrorAuthState({
    required this.message,
  });
}
