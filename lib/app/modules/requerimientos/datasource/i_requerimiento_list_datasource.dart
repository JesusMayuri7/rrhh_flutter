import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import 'requerimiento_model.dart';

abstract class IRequerimientoListDataSource {
  Future<ResponseModel> getListRequerimientos(ParamsRequerimiento params);
}

class GetListRequerimientos implements IRequerimientoListDataSource {
  final IClientCustom httpCustom;
  GetListRequerimientos({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getListRequerimientos(
      ParamsRequerimiento params) async {
    Uri url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/requerimientos/' + params.anio, {'q': 'http'});

    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      //var body = jsonDecode(response.data);
      String bodyData = jsonEncode(response.data);

      List<RequerimientoModel> result = requerimientoModelFromJson(bodyData);
      return ResponseModel(
          data: result, status: response.status, message: response.message);
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
