// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SessionEntityAuth extends Equatable {
  final bool status;
  final String token;
  final String message;
  final int expiresIn;
  final String anio;
  final bool isLogged;
  final String email;
  SessionEntityAuth({
    required this.status,
    required this.token,
    required this.message,
    required this.expiresIn,
    required this.anio,
    required this.isLogged,
    required this.email,
  });

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

  SessionEntityAuth copyWith({
    bool? status,
    String? token,
    String? message,
    int? expiresIn,
    String? anio,
    bool? isLogged,
    String? email,
  }) {
    return SessionEntityAuth(
        status: status ?? this.status,
        token: token ?? this.token,
        message: message ?? this.message,
        expiresIn: expiresIn ?? this.expiresIn,
        anio: anio ?? this.anio,
        isLogged: isLogged ?? this.isLogged,
        email: email ?? this.email);
  }
}
