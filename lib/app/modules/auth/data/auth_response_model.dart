import 'dart:convert';

import 'package:rrhh_clean/core/domain/entities/session_entity.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel extends SessionEntity {
  LoginResponseModel(
      {required bool status,
      required String token,
      required String message,
      required int expiresIn,
      required String anio,
      required String email,
      required bool isLogged})
      : super(
            status: status,
            token: token,
            message: message,
            expiresIn: expiresIn,
            anio: anio,
            email: email,
            isLogged: isLogged);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
          status: json["status"],
          token: json["token"],
          message: json["message"],
          anio: json["anio"] ?? '2023',
          email: json["email"] ?? '',
          isLogged: json["is_logged"] ?? true,
          expiresIn: json["expires_in"] ?? 0);

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "message": message,
        "expires_in": expiresIn,
      };
}
