import 'dart:convert';
import 'dart:io';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_update_liquidacion_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/models/liquidacion_model.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/update_liquidacion_usecase.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class UpdateLiquidacionDatasourceImpl implements IUpdateLiquidacionDatasource {
  Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/liquidacion/update_liquidacion',
      {'q': '{http}'});

  final IClientCustom httpCustom;

  UpdateLiquidacionDatasourceImpl({required this.httpCustom});

  @override
  Future<Map<String, dynamic>> upddateLiquidacion(
      ParamsUpdateLiquidacion paramsUpdateLiquidacion) async {
    print(paramsUpdateLiquidacion.toString());

    Map<String, dynamic> params = {
      "liquidacion_id": paramsUpdateLiquidacion.liquidacionId,
      "campo": paramsUpdateLiquidacion.campo,
      "valor": paramsUpdateLiquidacion.valor,
    };

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(params), (i) => responseFromJson(i));

      LiquidacionModel result = LiquidacionModel.fromJson(response.data[0]);

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
