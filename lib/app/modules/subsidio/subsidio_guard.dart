import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_module.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';

class SubsidioGuard extends RouteGuard {
  SubsidioGuard() : super(redirectTo: '/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    await Modular.isModuleReady<AppModule>();
    //final share = Modular.getAsync<SharedPreferences>();
    //bool isExpired = false;
    /*
    share.then((pref) {
      if (Jwt.isExpired(pref.getString('token') ?? '')) isExpired = true;
    });
    */

    final authBloc = Modular.get<AuthBloc>();
    // print((appBloc.state as SuccessAuthState).loginResponseEntity.status);

    return authBloc.state.loginResponseEntity!.isLogged;

    //return !isExpired;
  }
}
