import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/documentos/data/model/documento_model.dart';
import 'package:rrhh_clean/app/modules/documentos/domain/documentos_list_usecase.dart';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

abstract class IDocumentosListDataSource {
  Future<ResponseModel> getListDocumentos(ParamsDocumentos params);
}

class GetListDocumentosImpl implements IDocumentosListDataSource {
  final IClientCustom httpCustom;
  GetListDocumentosImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getListDocumentos(ParamsDocumentos params) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/documentos', {'q': 'http'});

    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      //String body = jsonDecode(response.data);

      List<DocumentoModel> result = documentoModelFromJson(bodyData);
      return ResponseModel(
          data: result, status: response.status, message: response.message);
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
