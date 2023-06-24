// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../domain/login_auth_usecase.dart';
import '../data/auth_response_model.dart';
import '../data/i_auth_core_datasource.dart';

import 'package:rrhh_clean/core/errors/exceptions.dart';

class AuthDioDataSourceImpl implements IAuthCoreDataSource {
  Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/auth/login', {'q': '{http}'});

  final IClientCustom httpCustom;
  AuthDioDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<LoginResponseModel> login(AuthCoreParams params) async {
    try {
/*       var response = await this.dio.post(
            url.toString(),
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
            data: json.encode(params.toMap()),
          ); */



      ResponseModel response = await httpCustom.request('POST', url.toString(),
          json.encode(params.toMap()), (i) => responseFromJson(i));



      // Clipboard.setData(ClipboardData(text: response.data.toString()));

      //var result = json.decode(response.data);

      //if (response.statusCode == 200)
      return loginResponseModelFromJson(response.data);

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
