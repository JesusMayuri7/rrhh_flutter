import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';

import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/auth_response_model.dart';
import '../data/i_auth_core_datasource.dart';

class AuthHttpClientDataSourceImpl implements IAuthCoreDataSource {
  Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/auth/login', {'q': '{http}'});

  //final HttpClient http;

  @override
  Future<LoginResponseModel> login(AuthCoreParams params) async {
     HttpClient httpClient = HttpClient();

    try {

     httpClient.findProxy = (uri) {
    return "DIRECT";
  };

    HttpClientRequest request = await httpClient.postUrl(url);


    request.headers.set('content-type', 'application/json');

    request.add(utf8.encode(json.encode(params.toMap())));

    HttpClientResponse response = await request.close();

    final stringData = await response.transform(utf8.decoder).join();

    print(stringData);

      if (response.statusCode == 200)
        return loginResponseModelFromJson(stringData);
      throw Exception('Error en el servidor');
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
