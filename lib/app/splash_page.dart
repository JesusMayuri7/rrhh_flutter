import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_module.dart';
import 'package:rrhh_clean/app/app_service.dart';


class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //final appBloc = Modular.get<AppBloc>();
  String? anioSelected;

  @override
  initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Modular.isModuleReady<AppModule>();
    final appService = await Modular.get<AppService>();
    if (appService.sessionEntity == null) {
      print('enviando a login');
      Modular.to.pushNamedAndRemoveUntil('/login/', (p0) => false);
    } else {
      Modular.to.pushReplacementNamed('/start/agenda/');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('splash page');
    //print('estado 1' + appBloc.state.toString());
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
