import '../../domain/entities/response_parameter_cap_entity.dart';
import 'parameter_cap_model.dart';

class ResponseParameterCapModel extends ResponseParameterCapEntity {
  ResponseParameterCapModel(
      {required int status,
      required String message,
      required List<ParameterCapModel> data})
      : super(
          status: status,
          message: message,
          data: data,
        );
}
