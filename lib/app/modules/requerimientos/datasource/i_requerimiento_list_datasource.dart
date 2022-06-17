import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/requerimientos/data/model/requerimiento_model.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

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
    Uri url = Uri.http('rrhh.pvn.gob.pe',
        '/api/presupuesto/requerimiento/' + params.anio, {'q': 'http'});

    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      var body = jsonDecode(response.data);
      String bodyData = jsonEncode(body);

      List<RequerimientoModel> result = requerimientoModelFromJson(bodyData);
      return ResponseModel(
          data: result, status: body['status'], message: body['message']);
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
