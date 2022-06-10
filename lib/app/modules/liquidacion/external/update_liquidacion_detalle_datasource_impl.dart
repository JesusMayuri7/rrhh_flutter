import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rrhh_clean/core/config/http_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../data/datasource/i_update_liquidacion_detalle_datasource.dart';
import '../data/models/liquidacion_detalle._model.dart';
import '../domain/usecases/update_liquidacion_detalle.dart';
import '../../../../core/errors/exceptions.dart';

class UpdateLiquidacionDetalleDatasourceImpl
    implements IUpdateLiquidacionDetalleDatasource {
  Uri url = Uri.http('rrhh.pvn.gob.pe',
      '/api/liquidacion/update_liquidacion_detalle', {'q': '{http}'});

  final IClientCustom httpCustom;

  UpdateLiquidacionDetalleDatasourceImpl({required this.httpCustom});

  @override
  Future<Map<String, dynamic>> upddateLiquidacionDetalle(
      ParamsUpdateLiquidacionDetalle paramsUpdateLiquidacionDetalle) async {
    Map<String, dynamic> params = {
      "liquidacion_detalle_id":
          paramsUpdateLiquidacionDetalle.liquidacionDetalleId,
      "dscMonto": paramsUpdateLiquidacionDetalle.dscMonto,
      "monto": paramsUpdateLiquidacionDetalle.monto,
    };

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(params), (i) => responseFromJson(i));

      LiquidacionDetalleModel result =
          LiquidacionDetalleModel.fromJson(response.data);

      return {
        'status': response.status,
        'message': response.message,
        'data': result
      };
    } on SocketException {
      throw ServerException('Sin Conexion');
    } on HttpException {
      throw ServerException('Error de Servidor');
    } on FormatException {
      throw ServerException('Error de formato');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
