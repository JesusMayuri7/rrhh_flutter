import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/i_get_list_certificados.dart';
import '../data/model/certificado_model.dart';

class GetListCertificadoImpl implements IGetListCertificadosDatasource {
  final IClientCustom httpCustom;
  GetListCertificadoImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getListCertificados(String anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe',
        '/api/presupuestal/certificacion/${anio}', {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<CertificadoModel> certificado =
          certificadoListModelFromJson(bodyData);
      return ResponseModel(
          data: certificado,
          status: response.status,
          message: response.message);
      //resultFromJson(response.body);
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
