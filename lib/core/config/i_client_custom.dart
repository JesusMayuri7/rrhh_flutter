import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';

abstract class IClientCustom<T> {  
  Future<dynamic> request(String method, String url, dynamic data, Function(dynamic) fromJson);
  Future<dynamic> post(String url, dynamic data, Map<String,dynamic> headers);
  Future<List<int>> download(Uri uri);
  Future<List<int>> download2(Uri uri);
  Future<dynamic> load(String url, ParamsInportFile params, String method);
}

