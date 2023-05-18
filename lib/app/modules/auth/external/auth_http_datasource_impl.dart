import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';

import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/auth_response_model.dart';
import '../data/i_auth_core_datasource.dart';

class AuthHttpDataSourceImpl implements IAuthCoreDataSource {
  Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/auth/login', {'q': '{http}'});

  //final HttpClient http;

  @override
  Future<LoginResponseModel> login(AuthCoreParams params) async {
    try {
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(params.toMap()));

      var result = json.decode(response.body);

      if (response.statusCode == 200)
        return loginResponseModelFromJson(response.body);
      throw Exception(result['message']);
    } on SocketException {
      throw ServerException('Sin conexion');
    } on HttpException {
      throw ServerException("Error en el servidor");
    } on FormatException {
      throw ServerException("Formato incorrecto");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
