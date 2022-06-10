import 'liquidacion_entity.dart';

class ResponseLiquidacionEntity {
  final int status;
  final String message;
  final List<LiquidacionEntity> listLiquidacion;

  ResponseLiquidacionEntity(
      {required this.status,
      required this.message,
      required this.listLiquidacion});
}
