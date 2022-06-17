import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_fuentes_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/fuente_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetFuentesImpl implements IFuentesDatasourceApp {
  final IClientCustom httpCustom;
  GetFuentesImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getFuentes(String anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', 'api/presupuesto/get_fuentes');
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<FuenteEntity> fuentes = fuenteModelFromJson(bodyData);

      return ResponseModel(
          status: response.status, message: response.message, data: fuentes);
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
