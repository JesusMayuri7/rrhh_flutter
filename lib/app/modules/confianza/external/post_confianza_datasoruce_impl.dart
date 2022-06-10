import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/http_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';

import '../../../../core/data/models/response_model.dart';
import '../../../../core/errors/exceptions.dart';

import '../data/datasource/post_confianza_datasource..dart';
import '../data/models/confianza_model.dart';

class PostConfianzaDataSourceImpl implements IPostConfianzaDataSource {
  Uri url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/control/designaciones_create', {'q': 'http'});

  final IClientCustom httpCustom;
  PostConfianzaDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> postConfianza(ConfianzaModel confianzaModel) async {
    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(confianzaModel.toMap()), (i) => responseFromJson(i));

      //ResponseModel dataJson = ResponseModel.fromJson(result['data']);
      //if(result['status'] && )
      ConfianzaModel confianza = ConfianzaModel.fromJson(response.data);
      return ResponseModel(
          data: confianza, status: response.status, message: response.message);
    } on SocketException {
      throw ServerException('Sin Conexion');
    } on HttpException {
      throw ServerException('Error de Servidor');
    } on FormatException catch (e) {
      throw ServerException('Error de formato ' + e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
