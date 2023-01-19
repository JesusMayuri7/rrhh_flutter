import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_metas_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/meta_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetMetasImpl implements IMetasDatasourceApp {
  final IClientCustom httpCustom;
  GetMetasImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getMetas(String anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', 'api/presupuesto/get_metas/$anio');
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      var body = jsonEncode(response.data);

      List<MetaModel> metas = metaModelFromJson(body);

      return ResponseModel(
          status: response.status, message: response.message, data: metas);
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
