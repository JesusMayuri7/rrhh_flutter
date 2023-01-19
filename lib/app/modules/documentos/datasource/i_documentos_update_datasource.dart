import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/documentos/data/model/documento_model.dart';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../domain/update_documentos_use_case.dart';

abstract class IDocumentosUpdateDataSource {
  Future<ResponseModel> updateDocumentos(ParamsUpdateDocumento params);
}

class UpdateDocumentoDatasourceImpl implements IDocumentosUpdateDataSource {
  final IClientCustom httpCustom;
  UpdateDocumentoDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> updateDocumentos(ParamsUpdateDocumento params) async {
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
