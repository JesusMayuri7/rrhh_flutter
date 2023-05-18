import 'package:shared_preferences/shared_preferences.dart';

import '../core/domain/entities/session_entity.dart';

class AppService {
  AppService({required this.preferences});
  final SharedPreferences preferences;
  SessionEntity? sessionEntity;

  Future<void> init() async {
    this.sessionEntity = null;
    final SharedPreferences prefs = await preferences;
    final String token = prefs.getString('token') ?? '';
    final String anio = prefs.getString('anio') ?? '';
    final String message = prefs.getString('message') ?? '';
    final bool status = prefs.getBool('status') ?? false;
    final bool isLogged = prefs.getBool('isLogged') ?? false;
    final int expiresIn = prefs.getInt('expiresIn') ?? 0;
    final String email = prefs.getString('email') ?? '';
    if (token.isNotEmpty) {
      this.sessionEntity = SessionEntity(
          status: status,
          token: token,
          message: message,
          expiresIn: expiresIn,
          anio: anio,
          isLogged: isLogged,
          email: email);
    }
  }

  Future<void> saveSession(SessionEntity session) async {
    final SharedPreferences prefs = await preferences;
    prefs.clear();
    prefs.setString('token', session.token);
    prefs.setString('anio', session.anio);
    prefs.setString('message', session.message);
    prefs.setBool('status', session.status);
    prefs.setBool('isLogged', true);
    prefs.setInt('expiresIn', session.expiresIn);
    prefs.setString('email', session.email);
    this.sessionEntity = session;
  }

  Future<void> logout(SessionEntity session) async {
    final SharedPreferences prefs = await preferences;
    prefs.clear();
    this.sessionEntity = null;
  }
}
