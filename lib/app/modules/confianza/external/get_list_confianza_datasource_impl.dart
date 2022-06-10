import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';

import '../../../../core/data/models/response_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../data/datasource/get_confianza_datasource.dart';
import '../data/models/confianza_model.dart';

class GetListConfianzaDataSourceImpl implements IListConfianzaDataSource {
  final IClientCustom httpCustom;
  GetListConfianzaDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getListConfianza(String anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe',
        '/api/control/designaciones_index/' + anio, {'q': 'http'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<ConfianzaModel> confianza = confianzaModelFromJson(bodyData);
      return ResponseModel(
          data: confianza, status: response.status, message: response.message);
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
