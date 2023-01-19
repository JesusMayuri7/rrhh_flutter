import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../data/datasource/i_get_liquidacion_datasource.dart';
import '../data/models/liquidacion_model.dart';
import '../../../../core/errors/exceptions.dart';

class GetLiquidacionCasDatasourceImpl implements IGetLiquidacionCasDatasource {
  final IClientCustom httpCustom;

  GetLiquidacionCasDatasourceImpl({required this.httpCustom});

  @override
  Future<ResponseModel> getListLiquidacionCas(String anio) async {
    Uri url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/liquidacion/cas/' + anio, {'q': '{http}'});

    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<LiquidacionModel> liquidacionModel =
          liquidacionModelFromJson(bodyData);

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: liquidacionModel);
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
