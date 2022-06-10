import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/base_cap/data/models/cap_model.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasource/i_list_cap_datasoruce.dart';

class GetListCapDatasourceImpl implements IListCapDataSoruce {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";
  final IClientCustom httpCustom;

  GetListCapDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> listar(String anio) async {
    var url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/cap/base_cap_anio/' + anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<CapModel> baseCap = baseCapModelFromJson(bodyData);

      var result = ResponseModel(
          data: baseCap, status: response.status, message: response.message);
      return result;
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
