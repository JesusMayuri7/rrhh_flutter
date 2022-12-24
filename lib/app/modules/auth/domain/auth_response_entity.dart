// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final bool status;
  final String token;
  final String message;
  final int expiresIn;
  final String anio;
  final bool isLogged;
  final String email;
  LoginResponseEntity(
      {this.status = false,
      this.token = '',
      this.message = '',
      this.expiresIn = 0,
      this.anio = '',
      this.isLogged = false,
      this.email = ''});

  @override
  List<Object> get props {
    return [
      status,
      token,
      message,
      expiresIn,
      anio,
      isLogged,
      email,
    ];
  }

  LoginResponseEntity copyWith({
    bool? status,
    String? token,
    String? message,
    int? expiresIn,
    String? anio,
    bool? isLogged,
    String? email,
  }) {
    return LoginResponseEntity(
        status: status ?? this.status,
        token: token ?? this.token,
        message: message ?? this.message,
        expiresIn: expiresIn ?? this.expiresIn,
        anio: anio ?? this.anio,
        isLogged: isLogged ?? this.isLogged,
        email: email ?? this.email);
  }
}
