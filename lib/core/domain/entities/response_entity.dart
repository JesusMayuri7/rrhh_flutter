import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable {
  ResponseEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.token,
      this.expiresIn = 0,
      this.isLoged = false,
      this.anio = ''});

  final bool status;
  final String message;
  final dynamic data;
  final String token;
  final int expiresIn;
  final bool isLoged;
  final String anio;

  @override
  String toString() =>
      'ResponseEntity(status: $status, message: $message, data: $data, token: $token, expiresIn: $expiresIn,isLoged: $isLoged)';

  @override
  List<Object> get props {
    return [status, message, data, token, expiresIn, anio];
  }

  ResponseEntity copyWith(
      {bool? status,
      String? message,
      dynamic? data,
      String? token,
      int? expiresIn,
      bool? isLoged,
      String? anio}) {
    return ResponseEntity(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        token: token ?? this.token,
        expiresIn: expiresIn ?? this.expiresIn,
        isLoged: isLoged ?? this.isLoged,
        anio: anio ?? this.anio);
  }
}
