part of 'auth_bloc.dart';

abstract class AuthState {
  final SessionEntity? sessionEntity;

  const AuthState({
    this.sessionEntity,
  });

  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(sessionEntity: null);
}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final SessionEntity sessionEntity;

  SuccessAuthState({
    required this.sessionEntity,
  }) : super(sessionEntity: sessionEntity);

  @override
  List<Object> get props => [this.sessionEntity];

  SuccessAuthState copyWith({
    String? anio,
    bool? isLogged,
    SessionEntity? sessionEntity,
  }) {
    return SuccessAuthState(
      sessionEntity: sessionEntity ?? this.sessionEntity,
    );
  }
}

class ErrorAuthState extends AuthState {

  final String message;

  ErrorAuthState({
    required this.message,
  });

    @override
  List<Object> get props => [this.message];
}
