import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../../domain/update_judiciales_use_case.dart';
import '../model/judicial_model.dart';

abstract class IJudicialesUpdateDataSource {
  Future<ResponseModel> updateJudiciales(ParamsUpdateJudicial params);
}

class UpdateJudicialDatasourceImpl implements IJudicialesUpdateDataSource {
  final IClientCustom httpCustom;
  UpdateJudicialDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> updateJudiciales(ParamsUpdateJudicial params) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/judiciales', {'q': 'http'});

    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      //String body = jsonDecode(response.data);

      List<JudicialModel> result = judicialModelFromJson(bodyData);
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
