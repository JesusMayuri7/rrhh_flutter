import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_module.dart';
import 'package:rrhh_clean/app/app_service.dart';

class AppGuard extends RouteGuard {
  AppGuard() : super(redirectTo: '/login/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    await Modular.isModuleReady<AppModule>();
    AppService appService = await Modular.get<AppService>();

    if (appService.sessionEntity != null) {

      return true;
    }

    return false;
  }
}
