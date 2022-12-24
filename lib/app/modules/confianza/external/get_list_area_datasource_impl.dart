import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';

import '../../../../core/data/models/area_model.dart';
import '../../../../core/data/models/response_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../data/datasource/get_area_datasource.dart';

class GetListAreaDataSourceImpl implements IListAreaDataSource {
  Uri url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/configuracion/get_areas', {'q': 'http'});

  final IClientCustom httpCustom;
  GetListAreaDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getListAreas() async {
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<AreaModel> areas = areaModelFromJson(bodyData);
      return ResponseModel(
          data: areas, status: response.status, message: response.message);
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
