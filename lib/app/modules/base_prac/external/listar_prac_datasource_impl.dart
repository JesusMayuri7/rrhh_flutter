import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:rrhh_clean/app/modules/base_prac/data/i_listar_prac_datasource.dart';
import 'package:rrhh_clean/app/modules/base_prac/data/practicante_model.dart';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';

class ListarPracDataSourceImpl implements IListarPracDataSource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  ListarPracDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<List<PracticanteModel>> listarPrac(String anio) async {
    var url = Uri.http('rrhh.pvn.gob.pe',
        '/api/formativa/base_formativa_anio/' + anio, {'q': '{http}'});
    log(url.toString());

    try {
      ResponseModel response = await this
          .httpCustom
          .request('GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);
      var result = practicanteModelFromJson(bodyData);

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
