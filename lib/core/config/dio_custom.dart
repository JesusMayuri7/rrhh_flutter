// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';

class DioCustom implements IClientCustom {
  final bloc = Modular.get<AuthBloc>();
  String? token;

  late Dio _dio;
  DioCustom() {
    init();
  }

  Future<void> init() async {
    token = (bloc.state as SuccessAuthState).loginResponseEntity.token;
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://rrhh.pvn.gob.pe/api',
        responseType: ResponseType.json,
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
      ),
    );

  (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
  client.findProxy = (url) {
    //return 'PROXY localhost:80';
    return 'DIRECT';
  };
  return client;
  };  

    _dio.interceptors.add(
        InterceptorsWrapper(onError: (error, errorInterceptorHandler) async {
      if (error.response?.statusCode == 401) {
        try {
          await _dio
              .post("http://rrhh.pvn.gob.pe/api/auth/refresh",
                  options:
                      Options(headers: {"Authorization": "Bearer " + token!}))
              .then((value) async {
            if (value.statusCode == 200) {
              token = Map<String, dynamic>.from(value.data)['token'];
              error.requestOptions.headers["Authorization"] =
                  "Bearer " + token!;
              final opts = new Options(
                  method: error.requestOptions.method,
                  headers: error.requestOptions.headers);
              Response<String> cloneReq = await _dio.request(
                  error.requestOptions.path,
                  options: opts,
                  data: error.requestOptions.data,
                  queryParameters: error.requestOptions.queryParameters);
              return errorInterceptorHandler.resolve(cloneReq);
            } else {
              // bloc.add( ));
              Modular.to.navigate('/login');
              throw Exception('Inicie sesion');
            }
          });
        } on Exception {
          Modular.to.navigate('/login');
          //(Modular.get<AuthCoreBloc>().state as SuccessAuthState).loginResponseEntity.copyWith(status: false, token: '');
          return errorInterceptorHandler.next(error);
          //throw Exception('No podemos validar sus credenciales');
        }
      } else
        return errorInterceptorHandler.next(error);
    }, onRequest: (request, requestInterceptorHandler) {
      print("${request.method} | ${request.path} | ${request.baseUrl}");
      request.headers["Authorization"] = "Bearer " + token!;
      return requestInterceptorHandler.next(request);
    }, onResponse: (response, responseInterceptorHandler) {
      return responseInterceptorHandler.next(response);
    }));
  }

  @override
  Future<dynamic> request(method, url, data, Function(dynamic) fromJson) async {
    log(url);
    //init();
    //try {
    Response<String> response =
        await _dio.request(url, data: data, options: Options(method: method));

    return fromJson(response.data.toString());
    /*} on Exception catch (e) {
      return Exception('Error de servidor');
    }*/
  }

  @override
  Future<Response> download(String url) async {
    Response response = await _dio.get(
      url,
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    return response;
  }

  @override
  Future<dynamic> load(
      String url, ParamsInportFile params, String method) async {
    FormData formData = FormData.fromMap({
      "anio": "2023",
      "file": await MultipartFile.fromFileSync(
        params.bytes!.path,
        filename: params.bytes!.path.split('/').last,
        contentType: new MediaType("application", "xls"),
      ),
      //   "anio": params.anio,
    });
    var response = await _dio.request(url,
        data: formData,
        options: Options(contentType: "application/form-data", method: method));
    return response;
  }
}
