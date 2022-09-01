import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';

abstract class IClientCustom<T> {
  Future<dynamic> request(
      String method, String url, dynamic data, Function(dynamic) fromJson);
  Future<dynamic> download(String url);
  Future<dynamic> load(String url, ParamsInportFile params, String method);
}
