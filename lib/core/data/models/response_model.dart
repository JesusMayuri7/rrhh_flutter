import 'dart:convert';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

ResponseModel responseFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel extends ResponseEntity {
  ResponseModel(
      {required bool status,
      required String message,
      dynamic data,
      int expiresIn = 0,
      String token = '',
      bool isLoged = false,
      String anio = ''})
      : super(
            data: data,
            status: status,
            message: message,
            expiresIn: expiresIn,
            token: token,
            isLoged: isLoged,
            anio: anio);

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"] ?? false,
        message: json["message"] ?? '',
        data: json["data"] ?? [],
        expiresIn: json["expires_in"] ?? 0,
        token: json["token"] ?? '',
        isLoged: json["is_loged"] ?? false,
        anio: json["anio"] ?? '',
      );
}
