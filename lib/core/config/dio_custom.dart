import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_parser/http_parser.dart';

import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';

class DioCustom implements IClientCustom {
  final appService = Modular.get<AppService>();
  String? token;

  Dio? _dio = Dio(
    BaseOptions(
      baseUrl: 'http://rrhh.pvn.gob.pe/api',
      responseType: ResponseType.json,
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
       receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60), // 60 seconds
          receiveTimeout: Duration(seconds: 60) // 60 seconds
    ),
  );
  DioCustom() {
    init();
  }

  Future<void> init() async {
    if(appService.sessionEntity != null)
      token = appService.sessionEntity!.token;

    (this._dio!.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (url) {          
      if (url.host.startsWith('rrhh'))
          return 'DIRECT';
        else
          return 'PROXY proxy1:8080';
      };
      return client;
    };
    
    this._dio!.interceptors.add(InterceptorsWrapper(
            onError: (error, errorInterceptorHandler) async {              
          if (error.response?.statusCode == 401) {
            try {
              await this
                  ._dio!
                  .post("http://rrhh.pvn.gob.pe/api/auth/refresh",
                      options: Options(
                          headers: {"Authorization": "Bearer " + token!}))
                  .then((value) async {
                if (value.statusCode == 200) {
                  token = Map<String, dynamic>.from(value.data)['token'];
                  error.requestOptions.headers["Authorization"] =
                      "Bearer " + token!;
                  final opts = new Options(
                      method: error.requestOptions.method,
                      headers: error.requestOptions.headers);
                  Response<String> cloneReq = await this._dio!.request(
                      error.requestOptions.path,
                      options: opts,
                      data: error.requestOptions.data,
                      queryParameters: error.requestOptions.queryParameters);
                  return errorInterceptorHandler.resolve(cloneReq);
                } else {                  
                  Modular.to.navigate('/login/');
                  throw Exception('Inicie sesion');
                }
              });
            } on Exception {
              print('expection $error');
              Modular.to.navigate('/login/');              
              return errorInterceptorHandler.next(error);              
            }
          } else
            return errorInterceptorHandler.next(error);
        }, onRequest: (request, requestInterceptorHandler) {          
          if(request.path != 'http://rrhh.pvn.gob.pe/api/auth/login')
            request.headers["Authorization"] = "Bearer " + token!;
          print("${request.method} | ${request.path} | ${request.baseUrl}");
          return requestInterceptorHandler.next(request);
        }, onResponse: (response, responseInterceptorHandler) {
          return responseInterceptorHandler.next(response);
        }));
  }

  @override
  Future<dynamic> request(method, url, data, Function(dynamic) fromJson) async {  
    Response<String> response = await this
        ._dio!
        .request(url, data: data, options: Options(method: method));        
    return fromJson(response.data.toString());
  }

  @override
  Future<Uint8List> download(Uri uri) async {
    Response response = await this._dio!.get<List<int>>(
          uri.toString(),
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        ).timeout(Duration(seconds: 60));        
    return response.data;
  }

   @override
  Future<List<int>> download2(Uri uri) async {
           final Dio _dio = Dio();
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (url) {    
        if (kIsWeb)
          return 'PROXY localhost:80';
        else
          return 'PROXY proxy1:8080';
      };
      return client;
    };
       
        Response<List<int>> response = await _dio.get<List<int>>(
          uri.toString(),
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        ).timeout(Duration(seconds: 60));        
    return Future.value(response.data);  
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
    });
    var response = await this._dio!.request(url,
        data: formData,
        options: Options(contentType: "application/form-data", method: method));
    return response;
  }
  
  @override
  Future post(String url, data, Map<String, dynamic> headers) async {
      var response = await this._dio!.post(url,data: data,options: Options(headers: headers));
      return response;
  }
}
