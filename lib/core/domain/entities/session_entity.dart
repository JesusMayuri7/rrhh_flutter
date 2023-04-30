// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final bool status;
  final String token;
  final String message;
  final int expiresIn;
  final String anio;
  final bool isLogged;
  final String email;

  SessionEntity({
    required this.status,
    required this.token,
    required this.message,
    required this.expiresIn,
    required this.anio,
    required this.isLogged,
    required this.email,
  });

  @override
  List<Object> get props => [
        status,
        token,
        message,
        expiresIn,
        anio,
        isLogged,
        email,
      ];

  @override
  bool get stringify => true;
}
