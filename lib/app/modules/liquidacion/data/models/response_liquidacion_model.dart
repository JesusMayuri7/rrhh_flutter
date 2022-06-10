import '../../domain/entities/response_liquidacion_entity.dart';

class ResponseLiquidacionModel extends ResponseLiquidacionEntity {
  ResponseLiquidacionModel(
      {required status, required message, required listLiquidacion})
      : super(
          status: status,
          message: message,
          listLiquidacion: listLiquidacion,
        );
}
