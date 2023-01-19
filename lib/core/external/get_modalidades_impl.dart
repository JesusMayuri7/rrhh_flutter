import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_modalidades_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/modalidad_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetModalidadesImpl implements IModalidadesDatasourceApp {
  final IClientCustom httpCustom;
  GetModalidadesImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getModalidades(String anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', 'api/configuracion/modalidades');
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      var body = jsonEncode(response.data);

      List<ModalidadModel> modalidades = modalidadModelFromJson(body);

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: modalidades);
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
