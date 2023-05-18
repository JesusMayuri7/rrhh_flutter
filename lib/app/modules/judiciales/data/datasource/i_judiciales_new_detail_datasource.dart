import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/judiciales/domain/new_judicial_detail_use_case.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../model/judicial_detalle_model.dart';

abstract class IJudicialesNewDetailDataSource {
  Future<ResponseModel> newJudicialDetail(ParamsNewJudicialDetail params);
}

class NewJudicialDetailDatasourceImpl implements IJudicialesNewDetailDataSource {
  final IClientCustom httpCustom;
  NewJudicialDetailDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> newJudicialDetail(ParamsNewJudicialDetail params) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/judiciales_detail', {'q': 'http'});

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(params.toMap()), (i) => responseFromJson(i));

      print(response.data);

      JudicialDetailModel result = JudicialDetailModel.fromJson(response.data);
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
