import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../../domain/new_judiciales_use_case.dart';
import '../model/judicial_model.dart';

abstract class IJudicialesNewDataSource {
  Future<ResponseModel> newJudicial(ParamsNewJudicial params);
}

class NewJudicialDatasourceImpl implements IJudicialesNewDataSource {
  final IClientCustom httpCustom;
  NewJudicialDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> newJudicial(ParamsNewJudicial params) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/judiciales', {'q': 'http'});

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(params.toMap()), (i) => responseFromJson(i));

      //String bodyData = jsonEncode(response.data);

      JudicialModel result = JudicialModel.fromJson(response.data);
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
