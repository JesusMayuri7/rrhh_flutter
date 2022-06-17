import 'dart:io';
import 'dart:convert';
import 'package:rrhh_clean/app/modules/home/data/cap_estado_opp_model.dart';

import 'package:rrhh_clean/app/modules/home/data/i_get_home_cap_estado_opp_datasource.dart';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';

import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetHomeCapEstadoOppDatasourceImpl
    implements IGetHomeCapEstadoOppDatasource {
  GetHomeCapEstadoOppDatasourceImpl({required this.httpCustom});

  final IClientCustom httpCustom;

  Uri url =
      Uri.http('rrhh.pvn.gob.pe', '/api/home/cap_estado_opp', {'q': '{http}'});

  @override
  Future<ResponseModel> getCapEstadoOpp() async {
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), null, (i) => responseFromJson(i));

      //var body = jsonDecode(response.body);
      String bodyData = jsonEncode(response.data);
      List<CapEstadoOppModel> result = capEstadoOppModelFromJson(bodyData);

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: result,
          token: '',
          expiresIn: 0);
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
