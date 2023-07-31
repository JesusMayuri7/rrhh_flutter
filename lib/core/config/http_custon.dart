import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';

class HttpCustom implements IClientCustom {
    
  @override
  Future<List<int>> download(Uri uri) async {
    http.Client? client = http.Client();
    
     final Map<String, String> httpHeaders = {      
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };
     
    List<int> _downloadData =[]; 
    try {
      var request= await client.get(uri,headers: httpHeaders);
    
      if(request.statusCode==200) {       
        _downloadData = request.bodyBytes;  
      }
    } finally{
      client.close();
    }
    return Future.value(_downloadData);

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
  Future load(String url, ParamsInportFile params, String method) {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  Future request(String method, String url, data, Function(dynamic p1) fromJson) {
    // TODO: implement request
    throw UnimplementedError();
  }
  
  @override
  Future post(String url, data, Map<String, dynamic> headers) {
    // TODO: implement post
    throw UnimplementedError();
  }

}
