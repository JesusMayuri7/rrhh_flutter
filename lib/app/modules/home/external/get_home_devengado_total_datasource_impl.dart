import 'dart:io';
import 'dart:convert';
import 'package:rrhh_clean/app/modules/home/data/devengado_total_model.dart';

import 'package:rrhh_clean/app/modules/home/data/i_get_home_devengado_total_datasource.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetHomeDevengadoTotalDatasourceImpl
    implements IGetHomeDevengadoTotalDatasource {
  GetHomeDevengadoTotalDatasourceImpl({required this.httpCustom});

  Uri url =
      Uri.http('rrhh.pvn.gob.pe', '/api/home/devengado_total', {'q': '{http}'});

  final IClientCustom httpCustom;

  @override
  Future<ResponseModel> getHomeDevengadoTotal() async {
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);
      List<DevengadoTotalModel> result = devengadoTotalModelFromJson(bodyData);

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
