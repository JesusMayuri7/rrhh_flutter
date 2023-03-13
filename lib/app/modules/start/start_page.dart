import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/presenter/logou_widget.dart';
import 'package:rrhh_clean/core/uitls/widgets/windows_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import '../auth/presenter/bloc/auth_bloc.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with WindowListener {
  final blocApp = Modular.get<AuthBloc>();
  //final  preferences = Modular.getAsync<SharedPreferences>();

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    //blocApp.close();
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Salir del sistema ?'),
            actions: [
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Si'),
                onPressed: () {
                  Navigator.of(context).pop();
                  windowManager.destroy();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final SharedPreferences preferences = Modular.get<SharedPreferences>();
    final String anioSelected = preferences.getString('anio').toString();
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            preferences.clear();
            Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
          }
        },
        bloc: this.blocApp,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(),
              automaticallyImplyLeading: false,
              centerTitle: true,
              toolbarHeight: 30,
              title: () {
                if (kIsWeb)
                  return Row(
                    children: [
                      Text('RRHH - PROVIAS NACIONAL - ${anioSelected}',
                          style: TextStyle(fontSize: 11)),
                      const Spacer(),
                      LogoutWidget(),
                    ],
                  );
                return DragToMoveArea(
                  child: Row(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('Recursos Humanos [' + anioSelected + ']',
                            style: TextStyle(fontSize: 13)),
                      ),
                      const Spacer(),
                      LogoutWidget(),
                      if (!kIsWeb) const WindowButtons(),
                    ],
                  ),
                );
              }(),
              leading: Builder(
                builder: (context) => Container(
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 0, bottom: 0),
                  child: new IconButton(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    icon: new Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
            ),
            body: RouterOutlet(),
            drawerEdgeDragWidth: 5,
            drawer: Container(
              width: 180,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      child: new DrawerHeader(
                        margin: EdgeInsets.all(0),
                        child: ListTile(
                          title: Text(
                            "Opciones de Consulta",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text("Agenda"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/agenda/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("AirHsp"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/airhsp/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Base CAP"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/base_cap/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Base CAS"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/base_cas/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Base PRAC"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/base_prac/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Certificados"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.pushNamed('/start/certificados/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Confianza"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/confianza/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Liquidacion"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/liquidacion/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Subsidio"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/subsidio/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Documentos"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/documentos/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Judiciales"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/judiciales/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Importar"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/import/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Requerimientos"),
                      //trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        //controller.titleAppBar = 'AirHsp';
                        Modular.to.navigate('/start/requerimientos/');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
