abstract class IClientCustom<T> {
  Future<dynamic> request(
      String method, String url, dynamic data, Function(dynamic) fromJson);
  Future<dynamic> download(String url);
}
