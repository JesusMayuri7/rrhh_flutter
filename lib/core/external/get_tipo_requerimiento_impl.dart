import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/data/models/tipo_requerimiento_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/datasource/i_tipo_requerimiento_datasource_app.dart';

class GetTipoRequerimientoImpl implements ITpoRequerimientoDatasourceApp {
  final IClientCustom httpCustom;
  GetTipoRequerimientoImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getTipoRequerimientos(String anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', 'api/configuracion/get_tipo_requerimientos');
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      //String bodyData = jsonEncode(response.data);

      List<TipoRequerimientoModel> tipoRequerimientos = tipoRequerimientoModelFromJson(response.data);
      print(tipoRequerimientos.toString());
      return ResponseModel(
          status: response.status, message: response.message, data: tipoRequerimientos);
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