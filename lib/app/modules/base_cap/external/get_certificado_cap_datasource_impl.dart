import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/base_cap/data/datasource/i_certificado_cap_datasource.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/presupuesto_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';

class GetCertificadoCapDatasourceImpl implements ICertificadoCapDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  GetCertificadoCapDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getCertificadoCap(String anio) async {
    var url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/cap/certificado/' + anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: presupuestoEntityFromJson(bodyData));
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
