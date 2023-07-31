

import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';
import 'package:uno/uno.dart';

import 'i_client_custom.dart';

class UnoCustom implements IClientCustom {
  @override
  Future<List<int>> download(Uri uri) {
    // TODO: implement download
    throw UnimplementedError();
  }

  @override
  Future<List<int>> download2(Uri uri) async {
    final uno = Uno();
    final response = await uno.get(uri.toString(),
    responseType: ResponseType.arraybuffer,
    onDownloadProgress: (total, current) {
      //print((current * total) / 100);
    },
  );
  
  final bytes = response.data as List<int>;
  return bytes;
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
  Future post( String url, data, Map<String, dynamic> headers) {
    // TODO: implement post
    throw UnimplementedError();
  }

}