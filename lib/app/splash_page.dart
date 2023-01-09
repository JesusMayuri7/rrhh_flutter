import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/auth/domain/auth_response_entity.dart';
import 'modules/auth/presenter/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final auth = Modular.get<AuthBloc>();

  @override
  initState() {
    super.initState();
    checkToken();
  }

  void checkToken() async {
    await Modular.isModuleReady<AppModule>();
    final SharedPreferences preferences = Modular.get<SharedPreferences>();

    final String token = preferences.getString('token') ?? '';
    final String anio = preferences.getString('anio') ?? '';

    final String message = preferences.getString('message') ?? '';
    final bool status = preferences.getBool('status') ?? false;
    final bool isLogged = preferences.getBool('isLogged') ?? false;
    final int expiresIn = preferences.getInt('expiresIn') ?? 0;
    final String email = preferences.getString('email') ?? '';
    //return Future.value(true);

    //if (auth.state.isLogged)
    if (isLogged) {
      auth.add(LoadPreferencesAuthEvent(
          loginResponseEntity: LoginResponseEntity(
              anio: anio,
              expiresIn: expiresIn,
              isLogged: isLogged,
              message: message,
              status: status,
              token: token,
              email: email)));
    } else {
      Modular.to.pushReplacementNamed('/login/');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build splas');
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: this.auth,
        listener: (context, state) {
          print(state.toString());
          if (state is SuccessAuthState)
            Modular.to.pushReplacementNamed('/start/agenda/');
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
