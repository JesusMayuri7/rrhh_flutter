import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_areas_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/area_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetAreasImpl implements IAreasDatasourceApp {
  final IClientCustom httpCustom;
  GetAreasImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getAreas() async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', 'api/configuracion/get_areas');
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<AreaModel> areas = areaModelFromJson(bodyData);
      return ResponseModel(
          status: response.status, message: response.message, data: areas);
    } on SocketException {
      throw ServerException('Sin conexion');
    } on HttpException {
      throw ServerException("No se encuentra la plaza");
    } on FormatException {
      throw ServerException("Formato incorrecto");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
