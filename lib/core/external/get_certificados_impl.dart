import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_certificados_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/certificados_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetCertificadosImpl implements ICertificadosDatasourceApp {
  final IClientCustom httpCustom;
  GetCertificadosImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getCertificados(String anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', 'api/presupuesto/certificados/$anio');
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<CertificadoModel> certificados = certificadoModelFromJson(bodyData);

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: certificados);
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
