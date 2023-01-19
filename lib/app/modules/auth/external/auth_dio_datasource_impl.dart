import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'package:dio/adapter.dart';

import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';

import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/auth_response_model.dart';
import '../data/i_auth_core_datasource.dart';

class AuthDioDataSourceImpl implements IAuthCoreDataSource {
  Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/auth/login', {'q': '{http}'});

  //final HttpClient http;

  @override
  Future<LoginResponseModel> login(AuthCoreParams params) async {
Dio dio = Dio();

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
  // Hook into the findProxy callback to set the client's proxy.
  client.findProxy = (url) {
    return 'PROXY localhost:80';
  };
  };

    try {
      var response = await dio.post(url.toString(),
  options: Options(headers: {
    HttpHeaders.contentTypeHeader: "application/json",
  }),
  data:  json.encode(params.toMap()),
);
           
       Clipboard.setData(ClipboardData(text: response.data.toString()));

      //var result = json.decode(response.data);

      //if (response.statusCode == 200)
        return loginResponseModelFromJson(json.encode(response.data));
      
     // throw Exception('Error desconocido');
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
