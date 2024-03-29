import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:rrhh_clean/app/app_service.dart';

class HttpApi extends http.BaseClient {
  //SharedPreferences sharedPref;

  http.Client _client = http.Client();

  HttpApi();
  final appService = Modular.get<AppService>();

  // Use a memory cache to avoid local storage access in each call
  String _inMemoryToken = '';
  String get userAccessToken {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = _loadTokenFromSharedPreference();
    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // intercept each call and add the Authorization header if token is available
    if (userAccessToken.isNotEmpty) {
      request.headers
          .putIfAbsent('Authorization', () => 'Bearer ' + userAccessToken);
    }

    return this._client.send(request).then((response) async {
      if (response.statusCode == 200) {
        print('todo ok 200');
      }
      if (response.statusCode == 401) {
        //if ((appBloc.state as AppLoggedState).sessionEntity!.status) {}
        print('si esta logeado');
        print('todo mal 401');
        reset();
        Modular.to.navigate('/login');
      }
      return response;
    }).catchError((error) {
      print(error);
      return throw (error);
    });
  }

  String _loadTokenFromSharedPreference() {
    var accessToken = appService.sessionEntity!.token;

    //final user = sharedPref.getString('token');

    // If user is already authenticated, we can load his token from cache
    //if (user != null)
    {
      // accessToken = user.accessToken;
    }
    return accessToken;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
