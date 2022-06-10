import '../../domain/usecases/update_liquidacion_detalle.dart';

abstract class IUpdateLiquidacionDetalleDatasource {
  Future<Map<String, dynamic>> upddateLiquidacionDetalle(
      ParamsUpdateLiquidacionDetalle paramsUpdateLiquidacionDetalle);
}
