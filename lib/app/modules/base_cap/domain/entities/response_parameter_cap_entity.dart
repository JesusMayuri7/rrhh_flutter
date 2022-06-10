import 'parameter_cap_entity.dart';

class ResponseParameterCapEntity {
  final int status;
  final String message;
  final List<ParameterCapEntity> data;
  ResponseParameterCapEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}
