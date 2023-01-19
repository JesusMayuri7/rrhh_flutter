import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../../domain/judiciales_list_usecase.dart';
import '../model/judicial_model.dart';

abstract class IJudicialesListDataSource {
  Future<ResponseModel> getListJudiciales(ParamsJudiciales params);
}

class GetListJudicialesImpl implements IJudicialesListDataSource {
  final IClientCustom httpCustom;
  GetListJudicialesImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getListJudiciales(ParamsJudiciales params) async {
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
