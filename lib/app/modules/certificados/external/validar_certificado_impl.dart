import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/i_validar_datasource.dart';

class ValidarCertificadoImpl implements IValidarDatasource {
  var url =
      Uri.http('rrhh.pvn.gob.pe', '/api/validar_certificado', {'q': '{http}'});

  final IClientCustom httpCustom;
  ValidarCertificadoImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> validarCertificado(
      {String? certiificado, String? anio}) async {
    Map<String, String?> params = {
      "dsc_certificado": certiificado,
      "anio": anio
    };

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          json.encode(params), (i) => responseFromJson(i));
      return response;
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
