import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_module.dart';
import 'package:rrhh_clean/app/bloc/app_bloc.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: '/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    //final share = Modular.getAsync<SharedPreferences>();
    //bool isExpired = false;
    /*
    share.then((pref) {
      if (Jwt.isExpired(pref.getString('token') ?? '')) isExpired = true;
    });
    */

    final appBloc = Modular.get<AppBloc>();

    return appBloc.state is AppLoggedState;
  }
}
