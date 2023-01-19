import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/i_base_cas_datasource.dart';
import '../data/model/base_cas_model.dart';

class BaseCasDatasourceImpl implements IBaseCasDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  BaseCasDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<List<BaseCasModel>> listar(String anio) async {
    
    var url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/cas/base_cas/' + anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));
      print(response.toString());

      String bodyData = jsonEncode(response.data);

      return baseCasModelFromJson(bodyData);
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

class BaseCasDatasourceImpl2023 implements IBaseCasDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  BaseCasDatasourceImpl2023({
    required this.httpCustom,
  });

  @override
  Future<List<BaseCasModel>> listar(String anio) async {
    var url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/cas/base_cas/' + anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      return baseCasModelFromJson2023(bodyData);
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
