import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/documentos/data/model/documento_model.dart';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../domain/new_documentos_use_case.dart';

abstract class IDocumentosNewDataSource {
  Future<ResponseModel> newDocumento(ParamsNewDocumento params);
}

class NewDocumentoDatasourceImpl implements IDocumentosNewDataSource {
  final IClientCustom httpCustom;
  NewDocumentoDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> newDocumento(ParamsNewDocumento params) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/documentos', {'q': 'http'});

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(params.toMap()), (i) => responseFromJson(i));

      DocumentoModel result = DocumentoModel.fromJson(response.data);
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
