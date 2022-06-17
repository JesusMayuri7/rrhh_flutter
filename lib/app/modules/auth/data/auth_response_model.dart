import 'dart:convert';

import '../domain/auth_response_entity.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
    required bool status,
    required String token,
    required String message,
    required int expiresIn,
  }) : super(
          status: status,
          token: token,
          message: message,
          expiresIn: expiresIn,
        );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        token: json["token"],
        message: json["message"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "message": message,
        "expires_in": expiresIn,
      };
}
