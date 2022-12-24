import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_add_liquidacion_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/models/liquidacion_model.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/add_liquidacion_usecase.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class AddLiquidacionDatasourceImpl implements IAddLiquidacionDatasource {
  Uri url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/liquidacion/add_liquidacion', {'q': '{http}'});

  final IClientCustom httpCustom;
  AddLiquidacionDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> addLiquidacion(
      ParamsAddLiquidacion paramsAddLiquidacion) async {
    Map<String, dynamic> params = {
      "liquidacion": paramsAddLiquidacion.toMap(),
    };

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(params['liquidacion']), (i) => responseFromJson(i));

      LiquidacionModel result = LiquidacionModel.fromJson(response.data);

      return ResponseModel(
          status: response.status, message: response.message, data: result);
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
