import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final bool status;
  final String token;
  final String message;
  final int expiresIn;
  final String anio;
  final bool isLogged;
  LoginResponseEntity(
      {this.status = false,
      this.token = '',
      this.message = '',
      this.expiresIn = 0,
      this.anio = '',
      this.isLogged = false});

  @override
  List<Object> get props => [status, token, message, expiresIn, anio, isLogged];

  LoginResponseEntity copyWith({
    bool? status,
    String? token,
    String? message,
    int? expiresIn,
    String? anio,
    bool? isLogged,
  }) {
    return LoginResponseEntity(
      status: status ?? this.status,
      token: token ?? this.token,
      message: message ?? this.message,
      expiresIn: expiresIn ?? this.expiresIn,
      anio: anio ?? this.anio,
      isLogged: isLogged ?? this.isLogged,
    );
  }
}
