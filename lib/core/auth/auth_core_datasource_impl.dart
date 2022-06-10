import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:rrhh_clean/core/auth/login_auth_usecase.dart';
import 'package:rrhh_clean/core/config/http_custom.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import 'auth_response_model.dart';
import 'i_auth_core_datasource.dart';

class AuthCoreDataSourceImpl implements IAuthCoreDataSource {
  Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/auth/login', {'q': '{http}'});

  //final HttpClient http;

  @override
  Future<LoginResponseModel> login(AuthCoreParams params) async {
    print(params);
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
      // print(e);
      throw ServerException(e.toString());
    }
  }
}
